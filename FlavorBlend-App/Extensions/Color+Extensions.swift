//
//  Color+Extensions.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import SwiftUI

extension Color {

    init(_ hex: UInt, alpha: Double = 1) {
    self.init(
        .sRGB,
        red: Double((hex >> 16) & 0xFF) / 255,
        green: Double((hex >> 8) & 0xFF) / 255,
        blue: Double(hex & 0xFF) / 255,
        opacity: alpha
    )
    }
}


extension Color {
    static let whiteFFFEFE = Color(0xFFFEFE)
    static let grayEFEEEE = Color(0xEFEEEE)
    static let black101010 = Color(0x101010)
    static let grayText868585 = Color(0x868585)
    static let grayText595959 = Color(0x595959)
    static let black373737 = Color(0x373737)
    static let black303030 = Color(0x303030)
    static let gray6F6D6D = Color(0x6F6D6D)


}

