//
//  View+Extension.swift
//  Trackme
//
//  Created by Liam Arbuckle on 16/5/2025.
//

import Foundation
import SwiftUI

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
