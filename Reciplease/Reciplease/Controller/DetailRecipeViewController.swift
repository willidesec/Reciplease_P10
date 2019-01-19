//
//  DetailRecipeViewController.swift
//  Reciplease
//
//  Created by William on 19/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    // MARK: - Properties
    var recipeDetail: RecipeDetail?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let recipeDetail = recipeDetail else { return }
        print(recipeDetail.name)

    }

}
