//
//  FridgeViewController.swift
//  Reciplease
//
//  Created by William on 08/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class FridgeViewController: UIViewController {
    
    let array = ["Lait", "Beurre", "Ammande", "Chocolat", "Banane", "Confiture", "Nutella", "Oeufs", "Pommes", "Poulet", "Frites", "Carottes", "Riz", "Yaourt", "Salade"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}

extension FridgeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FoodCollectionViewCell
        
        cell.foodLabel.text = array[indexPath.item]
        
        
        return cell
        
    }
    
    
}
