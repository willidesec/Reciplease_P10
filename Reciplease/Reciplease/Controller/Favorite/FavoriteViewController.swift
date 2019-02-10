//
//  FavoriteViewController.swift
//  Reciplease
//
//  Created by William on 10/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    // MARK: - Properties
    let detailRecipeVC = DetailRecipeViewController()
    var favoriteRecipes = Recipe.fetchAll()
    let array = [1, 2]

    // MARK: - Views
    lazy var favoriteTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
        detailRecipeVC.favoriteRecipeDelegate = self
    }
    
    // MARK: - Methods
    private func setConstraints() {
        view.addSubview(favoriteTableView)
        favoriteTableView.setAnchors(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }

}

extension FavoriteViewController: FavoriteRecipeDelegate {
    
    func saveRecipeToFavorite(recipe: RecipeDetail) {
        let favoriteRecipe = Recipe(context: AppDelegate.viewContext)
        favoriteRecipe.name = recipe.recipeInfos.name
        try? AppDelegate.viewContext.save()
        favoriteRecipes = Recipe.fetchAll()
        favoriteTableView.reloadData()
    }
    
    
}
