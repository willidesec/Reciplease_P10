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
        return 40
    }
}
