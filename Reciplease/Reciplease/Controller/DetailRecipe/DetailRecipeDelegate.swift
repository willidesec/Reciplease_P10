//
//  DetailRecipeDelegate.swift
//  Reciplease
//
//  Created by William on 27/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

extension DetailRecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let MAX_HEIGHT: CGFloat = 40.0
        return MAX_HEIGHT
    }
}
