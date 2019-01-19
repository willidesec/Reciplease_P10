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
    
    func toggleActivityIndicator(with activityIndicatorView: ActivityIndicatorView, shown: Bool) {
        if shown == true {
            guard let window = UIApplication.shared.keyWindow else { return }
            window.addSubview(activityIndicatorView)
            activityIndicatorView.setAnchors(top: window.topAnchor, leading: window.leadingAnchor, bottom: window.bottomAnchor, trailing: window.trailingAnchor)
            activityIndicatorView.alpha = 0.0
            UIView.animate(withDuration: 0.3) {
                activityIndicatorView.activityIndicator.startAnimating()
                activityIndicatorView.alpha = 1.0
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                activityIndicatorView.alpha = 0.0
                activityIndicatorView.activityIndicator.stopAnimating()
            }
        }
    }
    
    
}
