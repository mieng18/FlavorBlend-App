//
//  RecipeVM.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import Foundation



class RecipeVM: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Get the recipes and set it to our recipes property
        self.recipes = DataService.getLocalData()
    }
    
    
}
