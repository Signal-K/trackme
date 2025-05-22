//
//  IncomeIndex.swift
//  Trackme
//
//  Created by Liam Arbuckle on 23/5/2025.
//

import SwiftUI

struct IncomeBucket: Identifiable, Codable {
    let id: UUID
    let bucket_name: String
    let income: Double
    let start_date: String
    let end_date: String
    let frequency: String
    let currency: String
    let colour: String
}

struct IncomeBucketsView: View {
    @State private var buckets: [IncomeBucket] = []
    @State private var isLoading = true
    @State private var showingAddBucket = false
    
    var body: some View {
        VStack(alignment: .leading) {
            // Safe area padding so text doesn't go behind notch/status bar
            Text("Your Income Buckets")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
                .padding([.horizontal, .top])
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 44)
            
            if isLoading {
                ProgressView()
                    .padding()
            } else if buckets.isEmpty {
                VStack(spacing: 12) {
                    Text("No income buckets yet")
                        .foregroundColor(Color.gray.opacity(0.7))
                        .font(.body)
                    
                    Text("Add one to start tracking your income")
                        .foregroundColor(Color.gray.opacity(0.5))
                        .font(.callout)
                    
                    Button(action: {
                        showingAddBucket = true
                    }) {
                        Label("Add Income Bucket", systemImage: "plus.circle.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.primary10)
                            .cornerRadius(12)
                    }
                    .padding(.top, 20)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(buckets) { bucket in
                            BucketCard(bucket: bucket)
                        }
                        
                        Button(action: {
                            showingAddBucket = true
                        }) {
                            VStack {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white.opacity(0.7))
                                Text("Add")
                                    .foregroundColor(.white.opacity(0.7))
                                    .font(.caption)
                            }
                            .frame(width: 220, height: 140)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white.opacity(0.5), lineWidth: 2)
                            )
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 180)
            }
        }
        .background(Color.grayC)
        .ignoresSafeArea()
        .sheet(isPresented: $showingAddBucket) {
            AddIncomeBucket { newBucket in
                buckets.append(newBucket)
            }
        }
        .task {
            await fetchBuckets()
        }
    }
    
    func fetchBuckets() async {
        do {
            let user = try await supabase.auth.session.user
            let data: [IncomeBucket] = try await supabase
                .from("income_buckets")
                .select()
                .eq("user_id", value: user.id)
                .execute()
                .value
            
            buckets = data
        } catch {
            print("Error fetching income buckets: \(error)")
            buckets = []
        }
        isLoading = false
    }
}

struct BucketCard: View {
    let bucket: IncomeBucket
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(bucket.bucket_name)
                .font(.headline)
                .foregroundColor(.white)
            
            Text("\(bucket.currency)\(String(format: "%.2f", bucket.income))")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            Text("Every \(bucket.frequency.capitalized)")
                .foregroundColor(Color.gray.opacity(0.7))
                .font(.caption)
            
            Text("From \(bucket.start_date) to \(bucket.end_date)")
                .foregroundColor(Color.gray.opacity(0.5))
                .font(.caption2)
        }
        .padding()
        .background(Color(hex: bucket.colour).opacity(0.8))
        .cornerRadius(16)
        .frame(width: 220)
        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 4)
    }
}


extension Color {
    init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, (int >> 16) & 0xff, (int >> 8) & 0xff, int & 0xff)
        case 8:
            (a, r, g, b) = ((int >> 24) & 0xff, (int >> 16) & 0xff, (int >> 8) & 0xff, int & 0xff)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
