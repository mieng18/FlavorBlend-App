//
//  RecipeView.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 6/6/24.
//

import SwiftUI

struct RecipeView: View {
    let recipe: Recipe

    var size: CGFloat = 16 // Assuming size is for padding/margin
    
    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: recipe.image)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .scaledToFit()
                        .frame(width:  (UIScreen.main.bounds.width - 48) / 2,height:  (UIScreen.main.bounds.width - 60) / 2)
                        .cornerRadius(12)

                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(12)
                case .empty:
                    ProgressView()
                @unknown default:
                    EmptyView()
                }
            }
            Text(recipe.label)
                .font(.poppinsRegularFont(size: 14))
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .padding([.leading, .trailing],15)
        }
        .frame(width: (UIScreen.main.bounds.width - 60) / 2 , height:  (UIScreen.main.bounds.width - 60) / 2 + 50,alignment: .top)
        
    }
}


