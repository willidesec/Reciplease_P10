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
        if fridge.isEmpty {
            displayAlert(title: Constants.Alert.OUPS_TITLE, message: Constants.Alert.EMPTY_FRIDGE_MESSAGE)
        } else {
            let loadingScreen = LoadingScreen()
            loadingScreen.startLoading()
            yummlyService.searchRecipe(for: fridge) { (success, searchResult) in
                loadingScreen.stopLoading()
                if success {
                    if let searchResult = searchResult, searchResult.totalMatchCount != 0 {
                        self.displaySearchResultTableViewController(with: searchResult)
                    } else {
                        self.displayAlert(title: Constants.Alert.OUPS_TITLE, message: Constants.Alert.NO_RECIPE_MESSAGE)
                    }
                } else {
                    self.displayAlert(title: Constants.Alert.ERROR_TITLE
                        , message: Constants.Alert.ERROR_MESSAGE)
                }
            }
        }
    }
    
    @IBAction func clearButtonDidTapped(_ sender: UIButton) {
        if fridge.isEmpty {
            displayAlert(title: Constants.Alert.OUPS_TITLE, message: Constants.Alert.NOTHING_TO_CLEAR)
        } else {
            removeFoodFromFridge()
            collectionView.reloadData()
        }
    }
    
    // MARK: - Methods
    func addTextFieldToFridge() {
        guard let food = foodTextField.text, foodTextField.text != "" else {
            displayAlert(title: Constants.Alert.OUPS_TITLE, message: Constants.Alert.WRITE_INGREDIENT)
            return
        }
        fridge += food.separateElementAndReturnArray
        foodTextField.text = ""
    }
    
    private func removeFoodFromFridge() {
        fridge = []
    }
    
    private func displaySearchResultTableViewController(with passingObject: SearchRecipe) {
        let searchResultVC = SearchRecipeTableViewController()
        searchResultVC.searchResult = passingObject
        navigationController?.pushViewController(searchResultVC, animated: true)
    }

}



