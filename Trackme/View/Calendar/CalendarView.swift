//
//  CalendarView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct CalendarView: View {
    @EnvironmentObject var weekStore: WeekStore
    @State var subArr: [SubscriptionModel] = [
        SubscriptionModel(dict: ["name": "Sunrise", "icon": "spotify_logo", "price": "55.99" ]),
    ]
    
    let columns = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        ScrollView {
            ZStack {
                ZStack(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.gray70.opacity(0.5))
                        .frame(width: .screenWidth)
                        .cornerRadius(25)
                    
                    VStack {
                        Text("Calendar")
                            .foregroundColor(.gray30)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                        
                        Text("Subs\nSchedule")
                            .foregroundColor(.white)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                        
                        WeekHeaderView()
                            .padding(.horizontal, 20)
                        
                        WeeksTabView() { week in
                            WeekView(week: week)
                        }
                        
                        .frame(height: 110, alignment: .top)
                        .padding(.vertical, 20)
                    }
                }
            }
        }
    }
}
