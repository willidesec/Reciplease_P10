//
//  SearchResultTableViewController.swift
//  Reciplease
//
//  Created by William on 05/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class SearchRecipeTableViewController: UITableViewController {
    
    // MARK: - Properties
    var searchResult: SearchRecipe?
    let yummlyService = YummlyService()
    
    // MARK: - Views
    let loadingScreen = LoadingScreen()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        configureTableView()
    }
    
    // MARK: - Methods
    private func displayDetailRecipeViewController(with passingObject: RecipeDetail) {
        let detailRecipeVC = DetailRecipeViewController()
        detailRecipeVC.recipeDetail = passingObject
        navigationController?.pushViewController(detailRecipeVC, animated: true)
    }
    
    private func setupNavigationBar() {
        navigationItem.title = Constants.NavigationTitle.RECIPES
    }
    
    private func configureTableView() {
        tableView.register(RecipeCell.self, forCellReuseIdentifier: RecipeCell.identifier)
        tableView.tableFooterView = UIView()
    }
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult?.matches.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecipeCell.identifier, for: indexPath) as! RecipeCell
        
        // Set separator for all screen
        cell.separatorInset = UIEdgeInsets.zero
        cell.selectionStyle = .none
        
        guard let recipe = searchResult?.matches[indexPath.row] else { return UITableViewCell() }
        cell.recipe = recipe

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loadingScreen.startLoading()
        guard let searchResult = searchResult else { return }
        let id = searchResult.matches[indexPath.row].id
        let ingredients = searchResult.matches[indexPath.row].ingredients
        yummlyService.getRecipe(with: id, and: ingredients) { (success, recipeDetail) in
            self.loadingScreen.stopLoading()
            if success {
                guard let recipeDetail = recipeDetail else { return }
                self.displayDetailRecipeViewController(with: recipeDetail)
            } else {
                self.displayAlert(title: Constants.Alert.ERROR_TITLE, message: Constants.Alert.ERROR_MESSAGE)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
