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
    
    // MARK: - View
    let recipeDetailView = RecipeDetailView()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    
    // MARK: - Methods
    fileprivate func setupUI() {
        
        view.backgroundColor = UIColor.white

        view.addSubview(recipeDetailView)
        recipeDetailView.setAnchors(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        guard let recipeDetail = recipeDetail else { return }
        recipeDetailView.nameLabel.text = recipeDetail.name
    }

}
