//
//  ContentView.swift
//  QY M2L13 recipe list app
//
//  Created by Zhao Qianyu on 1/6/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView{
                    LazyVStack (alignment: .leading) {
                        ForEach(model.recipes) {r in
                            NavigationLink(
                                destination: RecipeDetailView(recipe: r),
                                label: {
                                    //MARK: Row item
                                    HStack(spacing: 20){
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                            .cornerRadius(5)
                                        Text(r.name)
                                            .foregroundColor(.black)
                                    }
                                })
                        }
                    }
                    
                }
                
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}
