//
//  FavoriteCell.swift
//  Reciplease
//
//  Created by William on 10/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class FavoriteCell: RecipeCell {
 
    var favoriteRecipe: Recipe? {
        didSet {
            nameLabel.text = favoriteRecipe?.name
            durationLabel.text = favoriteRecipe?.duration
            ratingLabel.text = favoriteRecipe?.rating
            guard let imageData = favoriteRecipe?.image else { return }
            recipeImage.image = UIImage(data: imageData)
        }
    }
}
