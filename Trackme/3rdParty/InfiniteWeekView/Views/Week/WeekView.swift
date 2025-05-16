//
//  WeekView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var weekStore: WeekStore
    var week: Week

    var body: some View {
        HStack {
            ForEach(Array(week.dates.enumerated()), id: \.offset) { index, date in
                VStack(spacing: 8) {
                    Text(date.toString(format: "d"))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 15)

                    Text(date.toString(format: "EEE").uppercased())
                        .foregroundColor(.gray30)
                        .frame(maxWidth: .infinity)

                    Spacer()

                    Circle()
                        .fill(Color.secondaryC)
                        .frame(width: 5, height: 5)

                    Spacer()
                }
                .frame(maxWidth: .infinity, minHeight: 110, maxHeight: 110)
                .background(
                    Color.gray60.opacity(date == weekStore.selectedDate ? 1.0 : 0.2)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.gray70, lineWidth: 1)
                )
                .cornerRadius(16)
                .onTapGesture {
                    withAnimation {
                        weekStore.selectedDate = date
                    }
                }
            }
        }
        .padding()
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(week: Week(
            index: 1,
            dates: [
                Date().addingTimeInterval(-3 * 86400),
                Date().addingTimeInterval(-2 * 86400),
                Date().addingTimeInterval(-1 * 86400),
                Date(),
                Date().addingTimeInterval(1 * 86400),
                Date().addingTimeInterval(2 * 86400),
                Date().addingTimeInterval(3 * 86400)
            ],
            referenceDate: Date()
        ))
        .environmentObject(WeekStore())
    }
}
