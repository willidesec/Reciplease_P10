//
//  FridgeViewController+TextFieldDelegate.swift
//  Reciplease
//
//  Created by William on 13/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

extension FridgeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addTextFieldToFridge()
        separateElementOfArray()
        collectionView.reloadData()
        return true
    }
}
