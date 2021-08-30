//
//  RecipeDetailView.swift
//  QY M2L13 recipe list app
//
//  Created by Zhao Qianyu on 4/6/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                
                //MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal,5)
                    .clipped()
                    .cornerRadius(20 )
                
                //MARK: Recipe title
                Text(recipe.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                    
                    
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()
                
                
                //MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.vertical,5)
                    ForEach(recipe.ingredients) { item in
                        Text("•  " + RecipeModel.getPortion(ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                    }
                }.padding(.horizontal,10)
                
                // divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(.headline)
                        .padding(.vertical,5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom,5)
                    }
                }.padding(.horizontal)
            }
            .padding()
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
