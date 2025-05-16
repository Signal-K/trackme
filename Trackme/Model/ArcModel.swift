//
//  ArcModel.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct ArcModel: Identifiable, Equatable {
    var id: UUID = UUID()
    var value: Double = 20
    var color: Color = .secondaryC
    var StatVal: Double = 0
    
    static func == (lhs: ArcModel, rhs: ArcModel) -> Bool {
        return lhs.id == rhs.id
    }
}
