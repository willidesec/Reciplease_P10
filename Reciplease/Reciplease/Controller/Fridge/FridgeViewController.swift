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
    let array = ["Lait", "Beurre", "Ammande", "Chocolat", "Banane", "Confiture", "Nutella", "Oeufs", "Pommes", "Poulet", "Frites", "Carottes", "Riz", "Yaourt", "Salade"]
    var fridge = [String]()
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var foodTextField: UITextField!
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(FoodCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    
    
    
    // MARK: - IBAction
    @IBAction func addButtonDidTapped(_ sender: UIButton) {
        addTextFieldToFridge()
        collectionView.reloadData()
    }
    
    @IBAction func searchButtonDidTapped(_ sender: UIButton) {
    }
    
    @IBAction func clearButtonDidTapped(_ sender: UIButton) {
        removeFoodFromFridge()
        collectionView.reloadData()
    }
    
    
    
    
    // MARK: - Methods
    private func addTextFieldToFridge() {
        guard let food = foodTextField.text, foodTextField.text != "" else {
            return
        }
        fridge.append(food)
        foodTextField.text = ""
    }
    
    private func removeFoodFromFridge() {
        fridge = []
    }

}


