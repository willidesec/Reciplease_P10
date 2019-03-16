//
//  FavoriteViewController+TableViewDelegate.swift
//  Reciplease
//
//  Created by William on 10/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = Constants.FavoriteTableView.MESSAGE
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return favoriteRecipes.isEmpty ? 300 : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
