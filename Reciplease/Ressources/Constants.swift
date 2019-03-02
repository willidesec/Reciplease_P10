//
//  Constants.swift
//  Reciplease
//
//  Created by William on 13/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import Foundation

struct Constants {
    
    static let NO_VALUE = "--"
    static let SAFARI_BUTTON_TITLE = "Get directions"
    
    struct NavigationTitle {
        static let RECIPES = "Recipes"
        static let DETAILS = "Details"
    }
    
    struct Yummly {
        static let URL = "http://api.yummly.com/v1/api/recipes?_app_id=5518c13f&_app_key=781f4dbcf40703ec5bdd1d709185e6ff"
    }
    
    struct FavoriteTableView {
        static let MESSAGE = """
                             No favorite recipes !
                             Add some ⭐️
                             """
    }
    
    struct Alert {
        static let OUPS_TITLE = "Oups"
        static let EMPTY_FRIDGE_MESSAGE = "Your fridge is empty\n Add some food 🍅"
        static let NO_RECIPE_MESSAGE = "No recipes with your ingredients 🙅🏻‍♂️"
        static let NOTHING_TO_CLEAR = "Nothing to clear 🤷🏻‍♂️"
        static let WRITE_INGREDIENT = "Write some ingredients"
        static let ERROR_TITLE = "Error"
        static let ERROR_MESSAGE = "Check your network connexion 👨🏻‍💻"
        static let CLOSE = "Close"
    }
    
}
