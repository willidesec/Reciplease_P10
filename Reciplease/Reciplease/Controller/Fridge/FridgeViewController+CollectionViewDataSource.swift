//
//  FridgeViewController+CollectionViewDataSource.swift
//  Reciplease
//
//  Created by William on 13/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

extension FridgeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if fridge.count > 0 {
            collectionView.backgroundView = nil
            return fridge.count
        } else {
            let rect = CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: 100)
            let noFoodLabel: UILabel = {
                let label = UILabel(frame: rect)
                label.text = "Your fridge is empty 😢\n"
                            + "Add some food !"
                label.numberOfLines = 0
                label.textAlignment = .center
                label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            return label
            }()
            
            collectionView.backgroundView = noFoodLabel
            
            return 0
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCell.identifier, for: indexPath) as! FoodCell
        
        
        cell.foodLabel.text = fridge[indexPath.item]
        
        
        return cell
    }
}

