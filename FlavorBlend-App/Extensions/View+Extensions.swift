//
//  View+Extensions.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import SwiftUI


extension View {
    
    // Global View Access For Show/Hide Tab Bar
    func showTabBar(){
        NotificationCenter.default.post(name: NSNotification.Name("SHOWTABBAR"), object: nil)
    }
    
    func hideTabBar(){
        NotificationCenter.default.post(name: NSNotification.Name("HIDETABBAR"), object: nil)
    }
    
    @ViewBuilder
    func setdTabBarBackground(color: Color)->some View{
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
            .background {
                color
                    .ignoresSafeArea()
            }
    }
}
