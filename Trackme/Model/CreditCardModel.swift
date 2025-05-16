//
//  CreditCardModel.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import SwiftUI

struct CreditCardModel: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var number: String = ""
    var month_year: String = ""
}
