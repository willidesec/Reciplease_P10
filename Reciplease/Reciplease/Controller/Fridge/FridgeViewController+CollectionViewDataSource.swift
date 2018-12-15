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
        return fridge.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodCell.identifier, for: indexPath) as! FoodCell
        
        
        cell.foodLabel.text = fridge[indexPath.item]
        
        
        return cell
    }
}

