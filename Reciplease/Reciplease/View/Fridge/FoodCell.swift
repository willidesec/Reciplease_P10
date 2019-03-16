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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let firstLetterLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont(name: "PermanentMarker-Regular", size: 60)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let foodLabel: UILabel = {
        let label = UILabel()
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
        backgroundColor = UIColor.redThemeColor
        addSubview(iconImageView)
        addSubview(foodLabel)
        addSubview(firstLetterLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: iconImageView)
        firstLetterLabel.centerX(to: self)
        firstLetterLabel.setAnchors(top: topAnchor, leading: nil, bottom: foodLabel.topAnchor, trailing: nil, padding: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        addConstraintsWithFormat(format: "V:|-8-[v0]-4-[v1(30)]-8-|", views: iconImageView, foodLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: foodLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
