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


struct HomeTab: View {
    @State var searchInput: String = ""
    @State var selectedOption: SelectedOption = SelectedOption.savoury
    @State var showDetailView: Bool = false
    @State var currentRecipe: Recipe?
    @StateObject var recipeVM = RecipeVM()

    @Namespace var animation
    var body: some View {
        
        VStack(spacing: 0){
            HStack() {
                
                
                Text("Flavor Blend")
                    .font(.poppinsBoldFont(size: 28))
                    .foregroundColor(.black101010)
                Spacer()

               
            }
            .padding(.horizontal,28)
            
          
            
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack(spacing:12){
                    customSearchBar()
                        .padding([.leading,.trailing],36)
                        .padding(.bottom,12)
            
                    tagView()
    
                    
                    popular()
                        .padding(.horizontal,28)

                    
                }
                
            }
            .padding(.top,15)
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
    private let adaptiveColumn = [
          GridItem(.adaptive(minimum: 150))
      ]
    
    
    
    @ViewBuilder func tagView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(SelectedOption.allCases, id: \.self) { option in
                    CustomButton(animation: animation, selectedOption: $selectedOption, option: option)
                }
            }
            .padding(.leading,24)
        }
        
    }
    
    @ViewBuilder func popular() -> some View {
        VStack(alignment: .leading,spacing: 4){

            HStack(spacing:6) {
                Text("Trending Recipe")
                    .font(.poppinsRegularFont(size: 24))
                    .foregroundColor(.black101010)
                
                Image(systemName: "flame").foregroundColor(.gray)
                    .scaledToFit()
                    .frame(width: 26,height: 26)
               

            }
            
            ZStack{
                
                ScrollView{
                            LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                                ForEach(recipeVM.recipes, id: \.self) { recipe in
                                    Text(String(recipe.name))
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .background(.blue)
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .font(.title)
                                }
                            }
                            
                        } .padding()
//                HStack {
//                    ZStack(alignment: .bottom){
//                        RoundedRectangle(cornerRadius: 20)
//                             .fill(
//                                 LinearGradient(gradient: Gradient(colors: [.yellow, .orange]),
//                                                startPoint: .center,
//                                                endPoint: .bottomTrailing))
//                             .frame(width: 161, height: 214)
//                             
//                        VStack {
//                
//
////                            VStack{
////                                if currentRecipe?.id == recipeVM.recipes[0].id && showDetailView{
////                                    Rectangle()
////                                        .fill(.clear)
////                                }else{
////                                    Image("burger_sandwich1")
////                                        .scaledToFill()
////                                        .frame(width: 130,height: 98.77)
////                                        .matchedGeometryEffect(id: recipeVM.recipes[0].id, in: animation)
////                                        .zIndex(1)
////                                }
////                            }
////                            .zIndex(1)
//
//
//                            
//                            VStack{
//                                Text("Beef Burger")
//                                    .font(.poppinsRegularFont(size: 18))
//                                    .foregroundColor(.black101010)
//                                
//                                HStack{
//                                    Text("$20")
//                                        .font(.poppinsSemiBoldFont(size: 18))
//                                        .foregroundColor(.black)
//                                    
//                                    Spacer()
//                                    Button(action: {
//                                        
//                                    }, label: {
//                                        
//                                        Image("add-circle-icon")
//                                            .frame(width: 28,height:28)
//                                        
//                                    })
//                                }
//                            }
//                            .padding(.horizontal,35)
//                            .zIndex(0)
//
//                            
//                            
//                        }
//                        .padding(.bottom,12)
//                       
//
//                         
//                    }
//                    .onTapGesture {
////                        currentRecipe = viewModel.recipes[0]
//                        showDetailView = true
//                        hideTabBar()
//                    }
//
//                    
//                    Spacer()
//                    
//                    ZStack(alignment: .bottom){
//                        RoundedRectangle(cornerRadius: 20)
//                             .fill(
//                                 LinearGradient(gradient: Gradient(colors: [.yellow, .orange]),
//                                                startPoint: .center,
//                                                endPoint: .bottomTrailing))
//                             .frame(width: 161, height: 214)
//                        
//                       
//                        VStack{
//                            Image("pizza-fries")
//                                .resizable()
//                               .scaledToFill()
//                               .frame(width: 130,height: 130)
//                               .clipped()
//                            
//                            
//
//                            VStack{
//                                Text("Pizza Fries")
//                                    .font(.poppinsRegularFont(size: 18))
//                                    .foregroundColor(.black101010)
//                                
//                                HStack{
//                                    Text("$32")
//                                        .font(.poppinsSemiBoldFont(size: 18))
//                                        .foregroundColor(.yellow)
//                                    
//                                    Spacer()
//                                    
//                                    Button(action: {
//                                        
//                                    }, label: {
//                                        
//                                        Image("add-circle-icon")
//                                            .frame(width: 28,height:28)
//                                        
//                                    })
//                                }
//                            }
//                            .padding(.horizontal,42)
//                            .padding(.bottom,12)
//                        }
//                        
//                    }
//                    .zIndex(1)
//                    .onTapGesture {
////                        currentRecipe = recipes[1]
//                        showDetailView = true
//                    }
//
//                    
//                }
                
            }
        }
    }
}

//struct HomeTab_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeTab()
//    }
//}


struct CustomButton: View {
    
//    var image: String
    // Since we're having asset Image...
//    var isSystemImage: Bool
    var animation: Namespace.ID
    @Binding var selectedOption: SelectedOption
    
    var option: SelectedOption

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
//
//#Preview {
//    HomeTab()
//}
