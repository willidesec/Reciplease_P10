//
//  RoundedButton.swift
//  Reciplease
//
//  Created by William on 15/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class UIRoundedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addCornerRadius(of: 5)
    }
}
