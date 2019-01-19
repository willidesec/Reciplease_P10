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
    
    /*
     Methode assez sécurisé ?
     */
    var searchResult: SearchResult?
    
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }




}
