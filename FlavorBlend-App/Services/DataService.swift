//
//  DataService.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import Foundation

class DataService {
    
   static func getLocalData() -> [Recipe] {
        
       guard let pathString = Bundle.main.path(forResource: "recipes", ofType: "json") else {
           return [Recipe]()
       }
       
        let url = URL(fileURLWithPath: pathString)
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            
            
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
            // Add unique IDs using map
            let recipesWithIDs = recipeData.map { recipe -> Recipe in
                var recipeWithID = recipe
                recipeWithID.id = UUID()
                recipeWithID.ingredients = recipeWithID.ingredients.map { ingredient -> Ingredient in
                    var ingredientWithID = ingredient
                    ingredientWithID.id = UUID()
                    return ingredientWithID
                }
                return recipeWithID
            }
            
            return recipesWithIDs
        }
        catch {
            //error with getting data
            print(error)
        }
        //Return the recipes
        return [Recipe]()
    }
}
