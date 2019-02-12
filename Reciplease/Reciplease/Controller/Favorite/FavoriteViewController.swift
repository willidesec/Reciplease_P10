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
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        favoriteRecipes = Recipe.fetchAll()
        favoriteTableView.reloadData()
    }
    
    // MARK: - Methods
    private func setConstraints() {
        view.addSubview(favoriteTableView)
        favoriteTableView.setAnchors(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }

}

