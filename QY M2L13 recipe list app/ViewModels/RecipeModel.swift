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
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //Get a singapore serving size by multiplying denominator by the recipe servings
            denominator *= recipeServings
            
            //Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            //Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get the whole portion if numerator is greater than denominator
            if numerator >= denominator {
                
                //Calculated whole portions
                wholePortions = numerator / denominator
                
                //Calculated the remainder
                numerator = numerator % denominator
                
                //Append the wholePortion to the portion string first
                portion += String(wholePortions)
            }
            
            //check if there is a fraction, if there is, append it to the portion string
            if numerator > 0 {
                //Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        //check if there is a unit for each of the particular ingredients
        if var unit = ingredient.unit {
            
            //adding the "S" suffix for pluralizing units
            if wholePortions > 1 {
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            //adding a space between the numbers and the unit
            portion += ingredient.num != nil && ingredient.denom != nil ? " " : ""
            
            return portion + unit
        }
        
        
        return String(portion)
        
    }
    
    
}
