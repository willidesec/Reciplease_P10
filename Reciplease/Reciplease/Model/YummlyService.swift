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
    
    let yummlyUrl = "http://api.yummly.com/v1/api/recipes?_app_id=5518c13f&_app_key=781f4dbcf40703ec5bdd1d709185e6ff&q=apple"
    
    func searchRecipe(callback: @escaping (Bool, SearchResult?) -> Void) {
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
    
}
