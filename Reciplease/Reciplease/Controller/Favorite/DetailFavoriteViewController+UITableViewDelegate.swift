//
//  DetailFavoriteViewController+UITableViewDelegate.swift
//  Reciplease
//
//  Created by William on 16/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

extension DetailFavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
