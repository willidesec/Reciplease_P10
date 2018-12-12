//
//  FridgeViewController.swift
//  Reciplease
//
//  Created by William on 08/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class FridgeViewController: UIViewController {
    
    // MARK: - PROPERTIES
    let array = ["Lait", "Beurre", "Ammande", "Chocolat", "Banane", "Confiture", "Nutella", "Oeufs", "Pommes", "Poulet", "Frites", "Carottes", "Riz", "Yaourt", "Salade"]
    
    // MARK: - OUTLET
    @IBOutlet weak var collectionView: UICollectionView!
    

    // MARK: - VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(FoodCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    // MARK: - METHODS
    

}




// MARK: - EXTENSION
extension FridgeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FoodCell
        
        
        cell.foodLabel.text = array[indexPath.item]
        
        
        return cell
    }
    
}

// Set the frame of the cell
extension FridgeViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3) - 2, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    
}

