//
//  Recipe.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/30/24.
//

import Foundation


struct Recipe: Identifiable, Decodable,Hashable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var rating: String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
    
}



struct Ingredient: Identifiable, Decodable, Hashable{
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?

}
