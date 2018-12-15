//
//  RoundedView.swift
//  Reciplease
//
//  Created by William on 15/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class UIRoundedView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addCornerRadius()
        addShadow()
    }

    
    func addCornerRadius() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.2
        
    }
    
}
