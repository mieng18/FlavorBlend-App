//
//  Recipe.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/30/24.
//

import Foundation

//
//struct Recipe: Identifiable, Decodable,Hashable {
//    var id:UUID?
//    var name:String
//    var featured:Bool
//    var image:String
//    var description:String
//    var rating: String
//    var prepTime:String
//    var cookTime:String
//    var totalTime:String
//    var servings:Int
//    var highlights:[String]
//    var ingredients:[Ingredient]
//    var directions:[String]
//    
//}


//struct Ingredient: Identifiable, Decodable, Hashable{
//    var id: UUID?
//    var name: String
//    var num: Int?
//    var denom: Int?
//    var unit: String?
//
//}

// MARK: - Welcome
struct Welcome: Codable {
    let from, to, count: Int
    let links: WelcomeLinks
    let hits: [Hit]

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

struct WelcomeLinks: Codable {
let next: Next
}
// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
    let links: HitLinks

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}

// MARK: - HitLinks
struct HitLinks: Codable {
    let linksSelf: Next

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Next
struct Next: Codable {
    let href: String
    let title: Title
}

enum Title: String, Codable {
    case nextPage = "Next page"
    case titleSelf = "Self"
}

struct Recipe:Codable,Hashable {
    static func == (lhs: Recipe, rhs: Recipe) -> Bool {
            return lhs.uri == rhs.uri
        }
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(uri)
    }
    
    let uri: String
    let label: String
    let image: String
    let images: Images
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels: [DietLabel]
    let healthLabels, cautions, ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories: Double
    let co2EmissionsClass: String?
    let totalWeight: Double
    let totalTime: Int
    let cuisineType: [CuisineType]
    let mealType: [MealType]
    let dishType: [DishType]
    let tags: [String]?
}

enum CuisineType: String, Codable {
    case american = "american"
    case british = "british"
    case french = "french"
    case italian = "italian"
}

enum DietLabel: String, Codable {
    case highFiber = "High-Fiber"
    case lowCarb = "Low-Carb"
    case lowFat = "Low-Fat"
    case lowSodium = "Low-Sodium"
}

struct Images: Codable {
    let thumbnail, small, regular: Large
    let large: Large?

    enum CodingKeys: String, CodingKey {
        case thumbnail = "THUMBNAIL"
        case small = "SMALL"
        case regular = "REGULAR"
        case large = "LARGE"
    }
}

// MARK: - Large
struct Large: Codable {
    let url: String
    let width, height: Int
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let quantity: Double
    let measure: String?
    let food: String
    let weight: Double
    let foodCategory: String?
    let foodID: String
    let image: String?

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

enum MealType: String, Codable {
    case breakfast = "breakfast"
    case lunchDinner = "lunch/dinner"
    case snack = "snack"
}
enum DishType: String, Codable {
    case biscuitsAndCookies = "biscuits and cookies"
    case cereals = "cereals"
    case condimentsAndSauces = "condiments and sauces"
    case desserts = "desserts"
}
