//
//  UIViewController.swift
//  Reciplease
//
//  Created by William on 12/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Dismiss the keyboard when you tap on the view
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func displayAlert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: Constants.Alert.CLOSE, style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
}
