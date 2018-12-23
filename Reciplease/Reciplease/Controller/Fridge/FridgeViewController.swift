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
        fridge += food.separateElementInArray()
        foodTextField.text = ""
    }
    
    private func removeFoodFromFridge() {
        fridge = []
    }

}



