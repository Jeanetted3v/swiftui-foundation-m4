//
//  Receipe.swift
//  QY M2L13 recipe list app
//
//  Created by Zhao Qianyu on 1/6/21.
//

import Foundation

class Recipe: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime: String
    var servings: Int
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
}

class Ingredient: Identifiable, Decodable {
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
    
}
