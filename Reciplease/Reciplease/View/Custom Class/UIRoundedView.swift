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
        addCornerRadius(of: 10)
        addShadow(width: 3, height: 3, radius: 10, opacity: 0.2)
    }
}
