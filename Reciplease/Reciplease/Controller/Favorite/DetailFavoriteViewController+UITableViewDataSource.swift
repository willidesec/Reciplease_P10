//
//  DetailFavoriteViewController+UITableViewDataSource.swift
//  Reciplease
//
//  Created by William on 16/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

extension DetailFavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.identifier, for: indexPath) as! IngredientCell
        
        
        return cell
    }
    
    
}
