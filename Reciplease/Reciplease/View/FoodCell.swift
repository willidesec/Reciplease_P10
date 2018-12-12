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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    // MARK: - Methods
    
    func setUpViews() {
        backgroundColor = UIColor.red
        addSubview(iconImageView)
        addSubview(foodLabel)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: iconImageView)
        addConstraintsWithFormat(format: "V:|-4-[v0]-4-[v1(30)]-8-|", views: iconImageView, foodLabel)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: foodLabel)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
