//
//  Recipe.swift
//  Reciplease
//
//  Created by William on 01/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation

struct SearchRecipe: Decodable {
    let totalMatchCount : Int
    var matches: [Infos]
}

struct Infos: Decodable {
    // TODO: prévoir image par default
    let smallImageUrls: [String]
    let ingredients: [String]
    let id: String
    let recipeName: String
    let totalTimeInSeconds: Int
    let rating: Int
}

