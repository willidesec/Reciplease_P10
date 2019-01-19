//
//  SearchResultTableViewController.swift
//  Reciplease
//
//  Created by William on 05/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class SearchResultTableViewController: UITableViewController {
    
    // MARK: - Properties
    var searchResult: SearchRecipe?
    let yummlyService = YummlyService()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        guard let recipe = searchResult?.matches[indexPath.row] else { return UITableViewCell() }
        cell.recipe = recipe

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let activityIndicatorView = ActivityIndicatorView()
        toggleActivityIndicator(with: activityIndicatorView, shown: true)
        guard let id = searchResult?.matches[indexPath.row].id else { return }
        yummlyService.getRecipe(with: id) { (success, recipeDetail) in
            self.toggleActivityIndicator(with: activityIndicatorView, shown: false)
            if success {
                guard let recipeDetail = recipeDetail else { return }
                print(recipeDetail.name)
                self.displayDetailRecipeViewController(with: recipeDetail)
            } else {
                // TODO: Display Alert
                print("error")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    // MARK: - Methods
    private func displayDetailRecipeViewController(with passingObject: RecipeDetail) {
//        let detailRecipeVC = DetailRecipeViewController()
//        detailRecipeVC.recipeDetail = passingObject
//        navigationController?.pushViewController(searchResultVC, animated: true)
    }

}
