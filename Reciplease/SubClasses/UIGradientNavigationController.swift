//
//  UIGradientNavigationController.swift
//  Reciplease
//
//  Created by William on 09/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class UIGradientNavigationController: UINavigationController {
    
    var colors = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientToNavBar()
    }
    
    private func setGradientToNavBar() {
        colors.append(UIColor.redThemeColor)
        colors.append(UIColor.pinkThemeColor)
        self.navigationBar.setGradientBackground(colors: colors)
    }
}
