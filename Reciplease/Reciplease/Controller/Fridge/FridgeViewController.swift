//
//  FridgeViewController.swift
//  Reciplease
//
//  Created by William on 08/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class FridgeViewController: UIViewController {
    
    // MARK: - Properties
    var fridge = [String]()
    let yummlyService = YummlyService()
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var foodTextField: UITextField!
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.layer.cornerRadius = 10
        // Register FoodCell
        collectionView.register(FoodCell.self, forCellWithReuseIdentifier: FoodCell.identifier)
        
        // Register FooterCollectionView
        collectionView.register(FooterCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionView.identifier)

    }
    
    // MARK: - IBAction
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        addTextFieldToFridge()
        collectionView.reloadData()
    }
    
    @IBAction func searchButtonDidTapped(_ sender: UIButton) {
        // Methode assez sécurisé ? Que se passe t'il si l'appel success mais que l'object est vide ?
        // S'assurer que l'on ouvre pas le nouveau controller si l'objet est vide
        let activityIndicatorView = ActivityIndicatorView()
        toggleActivityIndicator(with: activityIndicatorView, shown: true)
        yummlyService.searchRecipe(for: fridge) { (success, searchResult) in
            self.toggleActivityIndicator(with: activityIndicatorView, shown: false)
            if success {
                guard let searchResult = searchResult else { return }
                self.displaySearchResultTableViewController(with: searchResult)
            } else {
                // TODO: Display Alert
                print("error")
            }
        }
    }
    
    @IBAction func clearButtonDidTapped(_ sender: UIButton) {
        removeFoodFromFridge()
        collectionView.reloadData()
    }
    
    // MARK: - Methods
    func addTextFieldToFridge() {
        guard let food = foodTextField.text, foodTextField.text != "" else {
            return
        }
        fridge += food.separateElementAndReturnArray
        foodTextField.text = ""
    }
    
    private func removeFoodFromFridge() {
        fridge = []
    }
    
    private func displaySearchResultTableViewController(with passingObject: SearchResult) {
        let searchResultVC = SearchResultTableViewController()
        searchResultVC.searchResult = passingObject
        navigationController?.pushViewController(searchResultVC, animated: true)
    }

}



