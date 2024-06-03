//
//  MainTabView.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab: Tab = .first
    @State private var oldSelectedTab: Tab = .first
    @Namespace var animation
    @State var showTabBar: Bool = true

    
    init(){
        // MARK: For Hiding Native Tab Bar
        // As of Xcode 14.1 Beta .toolbar(.hidden) is broken for Native SwiftUI TabView
        UITabBar.appearance().isHidden = true
    }

   

    var body: some View {
        ZStack(alignment:.bottom) {
                TabView(selection: $selectedTab) {
                    HomeTab()
                        .tag(Tab.first)
                        .setTabBarBackground(color: .whiteFFFEFE)


                    HighLightTab()
                        .tag(Tab.second)
                        .setTabBarBackground(color: .whiteFFFEFE)

    

                }
      
            CutomTabBarView(selectedTab: $selectedTab)
                .offset(y: showTabBar ? 0 : 130)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: showTabBar)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            // Instead Of Passing Reference We're Going to Use NotificationCenter to Post Notification
            .onReceive(NotificationCenter.default.publisher(for: .init("SHOWTABBAR"))) { _ in
                showTabBar = true
            }
            .onReceive(NotificationCenter.default.publisher(for: .init("HIDETABBAR"))) { _ in
                showTabBar = false
            }

        }

    }


#Preview {
    MainTabView()
}


extension View{
    @ViewBuilder
    func setTabBarBackground(color: Color) -> some View {
        self
            .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

enum Tab: String, CaseIterable {
    case first
    case second
 
    
    var icon: String {
        switch self {
            case .first: return "house"
            case .second: return "star"
            
        }
    }
    var iconFilled: String {
        switch self {
            case .first: return "house.fill"
            case .second: return "star.fill"
            
        }
    }


}


struct CutomTabBarView: View {
    @Binding var selectedTab: Tab
    @Namespace var animation

    var body: some View {
        TabBar()
    }

    @ViewBuilder
    func TabBar() -> some View {
        
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id:\.rawValue) {tab in
                VStack(spacing:4) {
                    Image(systemName: selectedTab == tab ? tab.iconFilled : tab.icon)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        


                }
                .foregroundColor(selectedTab == tab ? Color.yellow : .gray)
                .padding(.top,8)
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    withAnimation(Animation.easeInOut) {
                        selectedTab = tab
                    }
                }
            }
        }
        .frame(height:54)
        .overlay(Divider(),alignment: .top)
        .background(Color.whiteFFFEFE)
    }
}


struct CutomTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        CutomTabBarView(selectedTab: .constant(.first))
    }
}
