//
//  InfiniteWeekView.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct InfiniteWeekView: View {
    @EnvironmentObject var weekStore: WeekStore


    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    VStack {
                       
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct InfinityTabPageWrapperView_Previews: PreviewProvider {
    static var previews: some View {
        InfiniteWeekView()
            .environmentObject(WeekStore())
    }
}
