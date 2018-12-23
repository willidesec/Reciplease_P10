//
//  FoodCollectionViewCell.swift
//  Reciplease
//
//  Created by William on 08/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class FoodCell: UICollectionViewCell {
    
    // MARK: - Property
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let foodLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.purple
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        addCornerRadius()
    }
    
    // MARK: - Methods
    
    func addCornerRadius() {
        layer.cornerRadius = 10
    }
    
    func setUpViews() {
        backgroundColor = UIColor.red
        addSubview(iconImageView)
        addSubview(foodLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: iconImageView)
        addConstraintsWithFormat(format: "V:|-8-[v0]-4-[v1(30)]-8-|", views: iconImageView, foodLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: foodLabel)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
