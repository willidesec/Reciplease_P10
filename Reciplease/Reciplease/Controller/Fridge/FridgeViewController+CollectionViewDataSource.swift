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
        
        cell.firstLetterLabel.isHidden = true
        cell.iconImageView.isHidden = false
        
        let ingredient = fridge[indexPath.item]
        
        cell.foodLabel.text = ingredient
        cell.iconImageView.image = UIImage(named: ingredient.lowercased())
        
        if cell.iconImageView.image == nil {
            cell.iconImageView.isHidden = true
            cell.firstLetterLabel.isHidden = false
            guard let firstLetter = ingredient.first else { return UICollectionViewCell() }
            cell.firstLetterLabel.text = String(firstLetter).uppercased()
        }
        return cell
    }
}

