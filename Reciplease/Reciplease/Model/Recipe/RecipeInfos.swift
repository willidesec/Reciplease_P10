//
//  GetRecipe.swift
//  Reciplease
//
//  Created by William on 19/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation

struct RecipeDetail {
    var recipeInfos: RecipeInfos
    var ingredients: [String]
}

struct RecipeInfos: Decodable {
    let totalTime: String
    let name: String
    let ingredientLines: [String]
    let images: [Image]
    let rating: Int
    let numberOfServings: Int
    let nutritionEstimates: [NutritionEstimates]
    let source: Source
}

struct Image: Decodable {
    let hostedLargeUrl: String
}

struct NutritionEstimates: Decodable {
    let value: Float
}

struct Source: Decodable {
    let sourceRecipeUrl: String
}
