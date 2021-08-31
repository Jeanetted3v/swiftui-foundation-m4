//
//  RecipeHighlights.swift
//  QY M2L13 recipe list app
//
//  Created by Zhao Qianyu on 31/8/21.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]) {
        
        //loop through the highlights and build the string, so that can have the commas, except for the last
        for index in 0..<highlights.count {
            
            //if this is the last item, don't add comma
            if index == highlights.count - 1 {
                allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
        
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test2", "test3"])
    }
}
