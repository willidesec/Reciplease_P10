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
    
    func searchRecipe(for ingredients: [String], callback: @escaping (Bool, SearchResult?) -> Void) {
        let yummlyUrl = configureUrl(with: Constants.Yummly.URL, and: ingredients)
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
            
            guard let searchResult = try? JSONDecoder().decode(SearchResult.self, from: data) else {
                callback(false, nil)
                return
            }
            
            callback(true, searchResult)
        }
    }
    
    fileprivate func configureUrl(with url: String, and ingredients: [String]) -> String {
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
}
