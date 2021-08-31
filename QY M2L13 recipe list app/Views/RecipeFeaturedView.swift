//
//  RecipeFeaturedView.swift
//  QY M2L13 recipe list app
//
//  Created by Zhao Qianyu on 29/7/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
            
            GeometryReader {geo in
                TabView (selection: $tabSelectionIndex) {
                    //Loop through each recipe to check which one is featured
                    ForEach(0..<model.recipes.count) { index in
                        //only show those that are featured
                        if model.recipes[index].featured == true {
                            
                            //Recipe card button
                            Button(action: {
                                //show the recipe detail sheet
                                self.isDetailViewShowing = true
                            }, label: {
                                //Recipe Card
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack(spacing:0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                            .font(Font.custom("Avenir", size: 15))
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                //show the recipe detail sheet
                                RecipeDetailView(recipe: model.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack (alignment: .leading, spacing:10) {
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Avenir", size: 15))
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform:{setFeaturedIndex()})
    }
    
    func setFeaturedIndex() {
        //Find the index of the first recipe that is featured
        var index = model.recipes.firstIndex {(recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
