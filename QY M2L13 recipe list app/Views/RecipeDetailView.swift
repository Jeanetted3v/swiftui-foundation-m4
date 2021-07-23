//
//  RecipeDetailView.swift
//  QY M2L13 recipe list app
//
//  Created by Zhao Qianyu on 4/6/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                
                //MARK: Recipe Image
                Image(recipe.image).resizable().scaledToFit().padding(.horizontal,5).clipped().cornerRadius(20 )
                
                //MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients").font(.headline).padding(.vertical,5)
                    ForEach(recipe.ingredients, id: \.self) { item in
                        Text("•  " + item).padding(.bottom, 1.0)
                    }
                }.padding(.horizontal,10)
                
                // divider
                Divider()
                
                //MARK: Directions
                VStack(alignment: .leading){
                    Text("Directions").font(.headline).padding(.vertical,5)
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ". " + recipe.directions[index]).padding(.bottom,5)
                    }
                }.padding(.horizontal,15)
            }
            
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a dummy recipe and pass it into the detail view so that we can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
