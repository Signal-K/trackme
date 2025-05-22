//
//  AddIncomeBucket.swift
//  Trackme
//
//  Created by Liam Arbuckle on 23/5/2025.
//

import SwiftUI

struct NewIncomeBucket: Encodable {
    let user_id: String
    let bucket_name: String
    let income: Double
    let start_date: String
    let end_date: String
    let frequency: String
    let currency: String
    let colour: String
}

struct AddIncomeBucket: View {
    @Environment(\.dismiss) private var dismiss

    @State private var bucketName = ""
    @State private var income = ""
    @State private var startDate = Date()
    @State private var endDate = Date().addingTimeInterval(60*60*24*365)
    @State private var frequency = "Monthly"
    @State private var currency = ""
    @State private var colour = "#3498db"

    @State private var isSaving = false
    @State private var errorMessage: String? = nil

    let frequencies = ["Weekly", "Fortnightly", "Monthly", "Quarterly", "Yearly"]

    var onAdd: ((IncomeBucket) -> Void)? = nil

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Bucket Details")) {
                    TextField("Bucket Name", text: $bucketName)
                    TextField("Income", text: $income)
                        .keyboardType(.decimalPad)
                    
                    DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                    DatePicker("End Date", selection: $endDate, in: Date()..., displayedComponents: .date)
                    
                    Picker("Frequency", selection: $frequency) {
                        ForEach(frequencies, id: \.self) { freq in
                            Text(freq)
                        }
                    }
                    
                    TextField("Currency", text: $currency)
                    TextField("Colour (Hex)", text: $colour)
                        .autocapitalization(.none)
                }

                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                Section {
                    Button(action: saveBucket) {
                        if isSaving {
                            ProgressView()
                        } else {
                            Text("Add Income Bucket")
                        }
                    }
                    .disabled(bucketName.isEmpty || income.isEmpty || currency.isEmpty || isSaving)
                }
            }
            .navigationTitle("Add Income Bucket")
            .navigationBarItems(trailing: Button("Cancel") {
                dismiss()
            })
        }
    }

    func saveBucket() {
        guard let incomeValue = Double(income) else {
            errorMessage = "Please enter a valid income number"
            return
        }

        if endDate <= Date() {
            errorMessage = "End date must be in the future"
            return
        }

        isSaving = true
        errorMessage = nil

        Task {
            do {
                let user = try await supabase.auth.session.user
                let newBucket = NewIncomeBucket(
                    user_id: user.id.uuidString,
                    bucket_name: bucketName,
                    income: incomeValue,
                    start_date: ISO8601DateFormatter().string(from: startDate),
                    end_date: ISO8601DateFormatter().string(from: endDate),
                    frequency: frequency.lowercased(),
                    currency: currency,
                    colour: colour
                )

                try await supabase
                    .from("income_buckets")
                    .insert(newBucket)
                    .execute()

                let createdBucket = IncomeBucket(
                    id: UUID(),
                    bucket_name: bucketName,
                    income: incomeValue,
                    start_date: ISO8601DateFormatter().string(from: startDate),
                    end_date: ISO8601DateFormatter().string(from: endDate),
                    frequency: frequency.lowercased(),
                    currency: currency,
                    colour: colour
                )

                isSaving = false
                dismiss()
                onAdd?(createdBucket)
            } catch {
                errorMessage = "Failed to add bucket: \(error.localizedDescription)"
                isSaving = false
            }
        }
    }
}

#Preview {
    AddIncomeBucket()
}
