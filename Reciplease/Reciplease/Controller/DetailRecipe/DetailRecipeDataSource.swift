//
//  DetailRecipeDataSource.swift
//  Reciplease
//
//  Created by William on 27/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

extension DetailRecipeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let recipeDetail = recipeDetail else { return 0 }
        return recipeDetail.recipeInfos.ingredientLines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.identifier, for: indexPath) as! IngredientCell
        
        guard let recipeDetail = recipeDetail else { return UITableViewCell() }
        cell.ingredientLabel.text = recipeDetail.recipeInfos.ingredientLines[indexPath.row]
        return cell
    }
    
    
}
