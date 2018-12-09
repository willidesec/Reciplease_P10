//
//  UINavigationBar.swift
//  Reciplease
//
//  Created by William on 09/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit


extension UINavigationBar {
    
    func setGradientBackground(colors: [UIColor]) {
        
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}
