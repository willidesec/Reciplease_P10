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

    // MARK: - Views
    lazy var favoriteTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.identifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.definesPresentationContext = true
        return searchController
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        setBehaviors()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        favoriteRecipes = Recipe.fetchAll()
        favoriteTableView.reloadData()
    }
    
    // MARK: - Methods
    private func setConstraints() {
        view.addSubview(favoriteTableView)
        favoriteTableView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
    
    private func setBehaviors() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        self.definesPresentationContext = true
    }

}




// MARK: - Extensions
extension FavoriteViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
           favoriteRecipes = Recipe.fetchAll()
        } else {
           favoriteRecipes = Recipe.fetch(with: searchText)
        }
        favoriteTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        favoriteRecipes = Recipe.fetchAll()
        favoriteTableView.reloadData()
    }
}

