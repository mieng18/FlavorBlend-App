//
//  RecipeVM.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import Foundation
import SwiftUI


enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidJson
    case unknown
}

@MainActor
class RecipeVM: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""

    func fetchData(query: String) async throws {
        isLoading = true
        let appId = ""
        let apiKey = ""
        let queryEncoded = "dessert"
        let from = 0
        let to = 10
        let urlString = "https://api.edamam.com/api/recipes/v2?type=public&q=\(queryEncoded)&app_id=\(appId)&app_key=\(apiKey)&from=\(from)&to=\(to)"
        
        
        guard let url = URL(string: urlString) else {
           throw NetworkError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
            recipes = decodedData.hits.map { $0.recipe }
            
        } catch {
            throw NetworkError.invalidURL
        }
        
        isLoading = false
    }
}


