//
//  CustomView.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import Foundation
import SwiftUI

// MARK: Custom Corner Path Shape
struct CustomCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
