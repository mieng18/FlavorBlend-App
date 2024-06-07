//
//  HomeTab.swift
//  FlavorBlend-App
//
//  Created by mai nguyen on 5/31/24.
//

import SwiftUI


enum SelectedOption: String, CaseIterable {
    case savoury
    case dessert
    case healthy
    case vegan
    case keto
    case lowcarb
    
    var title: String{
        switch self {
        case .savoury:
            return "Savoury"
        case .dessert:
            return "Dessert"
        case .healthy:
            return "Healthy"
        case .vegan:
            return "Vegan"
        case .keto:
            return "Keto"
        case .lowcarb:
            return "LowCarb"
        }
    }
}


private let adaptiveColumn = [GridItem(.flexible(),spacing: 16), GridItem(.flexible(),spacing: 16)]


struct HomeTab: View {
    @State var searchInput: String = ""
    @State var selectedOption: SelectedOption = SelectedOption.savoury
    @State var showDetailView: Bool = false
    @State var currentRecipe: Recipe?
    @StateObject private var recipeVM = RecipeVM()


    @Namespace var animation
    var body: some View {
        
        VStack(spacing: 12){
            HStack() {
                
                Image("icons8-forage_mixed")
                    .resizable()
                    .renderingMode(.template)

                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
                Text("Flavorblend")
                    .font(.poppinsRegularFont(size: 25))


            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding(.horizontal,28)
            .foregroundColor(.black)
        
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing:12){
                    customSearchBar()
                        .padding([.leading,.trailing],36)
                        .padding(.bottom,12)
            
                    tagView()

    
                    popular()
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width)
    }

    
    @ViewBuilder func customSearchBar() -> some View{
        HStack {
            Image(systemName: "magnifyingglass").foregroundColor(.gray)
                .scaledToFit()
                .frame(width: 28,height: 28)
            TextField("What are you looking for?", text: $searchInput)
                .font(.poppinsMediumFont(size: 16))
        }
        .padding(.horizontal,16)
        .padding(.vertical,12)
        .background(Color.grayEFEEEE)
        .cornerRadius(30)
        
    }
    
    @ViewBuilder func tagView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(SelectedOption.allCases, id: \.self) { option in
                    CustomButton(selectedOption:  $selectedOption, option: option, animation: animation)
                }
            }
            .padding(.leading,24)
        }
    }
    
    @ViewBuilder func popular() -> some View {
        VStack(alignment: .leading,spacing: 12){

            HStack(spacing:6) {
                Text("Trending Recipes")
                    .font(.poppinsMediumFont(size: 18))
                    .foregroundColor(.black101010)
                
                Image(systemName: "flame").foregroundColor(.gray)
                    .scaledToFit()

            }
            .padding(.horizontal,28)
            
            VStack{
        
                ScrollView{
                    LazyVGrid(columns: adaptiveColumn, spacing: 16) {
                        ForEach(recipeVM.recipes, id: \.self) { recipe in
                            RecipeView(recipe: recipe)
                            
                        }
                    }
                }
                .padding(.horizontal,24)
                .padding(.bottom,40)

            }
            
            .onAppear {
                Task {
                     try await recipeVM.fetchData(query: "chicken")
                }
            }
        }
    }
}



struct CustomButton: View {

    @Binding var selectedOption: SelectedOption
    var option: SelectedOption
    var animation: Namespace.ID

    var body: some View{
        
        HStack(spacing:24){
           
            VStack{
                Circle()
                    .frame(width: 60,height: 60)
                    .foregroundColor(selectedOption == option ? .yellow : .grayEFEEEE)
                    .cornerRadius(20)
                    .overlay(
                        Image("salad-pic")
                            .scaledToFit()
                            .frame(width: 70,height: 70)
                    )
                
                Text(option.title)
                    .font(.poppinsRegularFont(size: 14))
                    .foregroundColor(selectedOption == option ? .yellow : .grayText868585)
                
            }
            .onTapGesture {
                selectedOption = option
            }
        }
    }
}

#Preview {
    HomeTab()
}

