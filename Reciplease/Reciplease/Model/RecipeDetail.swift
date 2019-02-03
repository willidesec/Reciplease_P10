//
//  GetRecipe.swift
//  Reciplease
//
//  Created by William on 19/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation

struct RecipeDetail: Decodable {
    let totalTime: String
    let name: String
    let ingredientLines: [String]
    let images: [Image]
    let rating: Int
    let numberOfServings: Int
    let nutritionEstimates: [NutritionEstimates]
}

struct Image: Decodable {
    let hostedLargeUrl: String
}

struct NutritionEstimates: Decodable {
    let value: Float
}

// OBJECT custom a passer dans le prochain controller
struct CustomObject {
    let recipeDetail: RecipeDetail
    let ingredients: [String]
}
