//
//  Recipe.swift
//  Reciplease
//
//  Created by William on 01/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let totalMatchCount : Int
    var matches: [Recipe]
}

struct Recipe: Decodable {
    let imageUrlsBySize: [String: String]
    let ingredients: [String]
    let recipeName: String
    let totalTimeInSeconds: Int
    let rating: Int
}

