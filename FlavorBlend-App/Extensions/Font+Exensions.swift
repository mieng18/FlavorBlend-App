//
//  Font+Exensions.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import SwiftUI

extension Font {


    static var PoppinsFontBold = "Poppins-Bold"
    static var PoppinsFontLight = "Poppins-Light"
    static var PoppinsFontMedium = "Poppins-Medium"
    static var PoppinsFontRegular = "Poppins-Regular"
    static var PoppinsFontSemiBold = "Poppins-SemiBold"
    static var PoppinsFontThin = "Poppins-Thin"
    
    static var InterFontMedium = "Inter-Medium"

}

extension Font {
    
    
    static func poppinsBoldFont(size: CGFloat) -> Font {
        return Font.custom(Font.PoppinsFontBold, size: size)
    }
    
    static func poppinsLightFont(size: CGFloat) -> Font {
        return Font.custom(Font.PoppinsFontLight, size: size)
    }
    
    static func poppinsMediumFont(size: CGFloat) -> Font {
        return Font.custom(Font.PoppinsFontMedium, size: size)
    }
    
    static func poppinsRegularFont(size: CGFloat) -> Font {
        return Font.custom(Font.PoppinsFontRegular, size: size)
    }
    
    static func poppinsSemiBoldFont(size: CGFloat) -> Font {
        return Font.custom(Font.PoppinsFontSemiBold, size: size)
    }
    static func poppinsThinFont(size: CGFloat) -> Font {
        return Font.custom(Font.PoppinsFontThin, size: size)
    }
    
    static func interFontMedium(size: CGFloat) -> Font {
        return Font.custom(Font.InterFontMedium, size: size)
    }
    
}
    
    
    
