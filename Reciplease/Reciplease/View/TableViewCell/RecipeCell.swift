//
//  RecipeCell.swift
//  Reciplease
//
//  Created by William on 05/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    var recipe: Recipe? {
        didSet {
            
        }
    }
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let recipeImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red
        return image
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor.purple
        return label
    }()
    
    let ingredientLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor.blue
        return label
    }()
    
    let infoStackView: UIStackView = {
       let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.backgroundColor = UIColor.brown
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.backgroundColor = UIColor.green
        return label
    }()
    
    let durationAndRatingStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bgView)
        addSubview(recipeImage)
        addSubview(ratingLabel)
        addSubview(durationLabel)
        addSubview(infoStackView)
        addSubview(durationAndRatingStackView)
        
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(ingredientLabel)
        
        durationAndRatingStackView.addArrangedSubview(ratingLabel)
        durationAndRatingStackView.addArrangedSubview(durationLabel)

        
        bgView.setAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        recipeImage.setAnchors(top: bgView.topAnchor, leading: bgView.leadingAnchor, bottom: bgView.bottomAnchor, trailing: bgView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0))
        
        infoStackView.setAnchors(top: recipeImage.bottomAnchor, leading: bgView.leadingAnchor, bottom: bgView.bottomAnchor, trailing: bgView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        durationAndRatingStackView.setAnchors(top: nil, leading: recipeImage.leadingAnchor, bottom: recipeImage.bottomAnchor, trailing: recipeImage.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 5, bottom: 5, right: 5), size: CGSize(width: 0, height: 35))
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
