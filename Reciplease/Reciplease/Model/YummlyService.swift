//
//  RecipeService.swift
//  Reciplease
//
//  Created by William on 25/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import Foundation

class YummlyService {
    
    private var yummlySession: YummlySession
    
    init(yummlySession: YummlySession = YummlySession()) {
        self.yummlySession = yummlySession
    }
    
    func searchRecipe(for ingredients: [String], callback: @escaping (Bool, SearchRecipe?) -> Void) {
        let yummlyUrl = configureSearchRecipeUrl(with: Constants.Yummly.URL, and: ingredients)
        guard let url = URL(string: yummlyUrl) else { return }
        yummlySession.request(url: url) { responseData in
            guard responseData.response?.statusCode == 200 else {
                callback(false, nil)
                return
            }
            
            guard let data = responseData.data else {
                callback(false, nil)
                return
            }
            
            guard let searchResult = try? JSONDecoder().decode(SearchRecipe.self, from: data) else {
                callback(false, nil)
                return
            }
            
            callback(true, searchResult)
        }
    }
    
    fileprivate func configureSearchRecipeUrl(with url: String, and ingredients: [String]) -> String {
        var parameters = "&q="
        for ingredient in ingredients {
            if ingredient == ingredients.last {
                parameters += ingredient.lowercased()
            } else {
                parameters += "\(ingredient)+"
            }
        }
        var allowedIngredients = ""
        for ingredient in ingredients {
            allowedIngredients += "&allowedIngredient[]=\(ingredient.lowercased())"
        }
        
        let yummlyUrl = url + parameters + allowedIngredients
        print(yummlyUrl)
        return yummlyUrl
    }
    
    func getRecipe(with id: String, callback: @escaping (Bool, RecipeDetail?) -> Void) {
        let yummlyUrl = "http://api.yummly.com/v1/api/recipe/\(id)?_app_id=5518c13f&_app_key=781f4dbcf40703ec5bdd1d709185e6ff"
        guard let url = URL(string: yummlyUrl) else { return }
        yummlySession.request(url: url) { responseData in
            guard responseData.response?.statusCode == 200 else {
                callback(false, nil)
                return
            }
            
            guard let data = responseData.data else {
                callback(false, nil)
                return
            }
            
            guard let recipeDetail = try? JSONDecoder().decode(RecipeDetail.self, from: data) else {
                callback(false, nil)
                return
            }
            
            callback(true, recipeDetail)
        }
    }
    
}
