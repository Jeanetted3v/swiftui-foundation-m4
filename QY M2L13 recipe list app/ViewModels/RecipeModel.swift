//
//  RecipeModel.swift
//  QY M2L13 recipe list app
//
//  Created by Zhao Qianyu on 1/6/21.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    init() {
        // Create an instance of Data Service and get the data
        
        self.recipes = DataService.getLocalData()
        
        
    }
    
}
