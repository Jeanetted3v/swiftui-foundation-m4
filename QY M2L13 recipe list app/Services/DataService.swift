//
//  DataService.swift
//  QY M2L13 recipe list app
//
//  Created by Zhao Qianyu on 1/6/21.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        //parse local json file
        
        //Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherwise....
        guard pathString != nil else {
            return [Recipe]()
        }
        //Create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        //Create a data object
        do {
            let data = try Data(contentsOf: url)
            //Decode the data with a Json decoder
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                //Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                //Return the recipes
                return recipeData
            }
            catch {
                //error with parsing JSON
                print(error)
            }
        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
}
