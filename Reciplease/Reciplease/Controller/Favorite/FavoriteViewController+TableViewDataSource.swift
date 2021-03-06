//
//  FavoriteViewController+TableViewDataSource.swift
//  Reciplease
//
//  Created by William on 10/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.identifier, for: indexPath) as! FavoriteCell
        
        cell.favoriteRecipe = favoriteRecipes[indexPath.row]
        guard let ingredients = favoriteRecipes[indexPath.row].ingredients?.allObjects as? [Ingredient] else { return UITableViewCell() }
        var ingredientsText = ""
        for ingredient in ingredients {
            guard let name = ingredient.name else { return UITableViewCell() }
            ingredientsText += "\(name.localizedCapitalized), "
        }
        cell.ingredientLabel.text = ingredientsText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let favoriteRecipe = favoriteRecipes[indexPath.row]
        displayDetailFavoriteViewController(recipe: favoriteRecipe)
    }
    
    private func displayDetailFavoriteViewController(recipe: Recipe) {
        let detailFavoriteVC = DetailFavoriteViewController(recipe: recipe)
        navigationController?.pushViewController(detailFavoriteVC, animated: true)
    }
    
    
}
