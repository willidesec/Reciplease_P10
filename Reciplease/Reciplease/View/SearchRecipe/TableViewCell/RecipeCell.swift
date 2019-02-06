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
            guard let imageURL = recipe?.smallImageUrls[0] else { return }
            let bigImageUrl = imageURL.dropTwoLastAndReplaceWith("500")
            guard let url = URL(string: bigImageUrl) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            recipeImage.image = UIImage(data: data)
            nameLabel.text = recipe?.recipeName
            guard let time = recipe?.totalTimeInSeconds else { return }
            durationLabel.text = String(time)
            guard let rating = recipe?.rating else { return }
            ratingLabel.text = String(rating)
            guard let allIngredients = recipe?.ingredients else { return }
            // TODO: Majuscule sur les noms d'ingrédients
            let ingredientsText = allIngredients.joined(separator: ", ")
            ingredientLabel.text = ingredientsText
            
        }
    }
    
    let shadowBgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.addCornerRadius(of: 10)
        view.addShadow(width: 3, height: 3, radius: 10, opacity: 0.2)
        return view
    }()
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.addCornerRadius(of: 10)
        view.clipsToBounds = true
        return view
    }()
    
    let bgImageView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()

    let recipeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.7
        return imageView
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    let ingredientLabel: UILabel = {
       let label = UILabel()
        return label
    }()
    
    lazy var infoStackView: UIStackView = {
       let stack = UIStackView(arrangedSubviews: [self.nameLabel, self.ingredientLabel])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 5
        return stack
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.white
        return label
    }()
    
    let durationBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.addCornerRadius(of: 20)
        return view
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var durationAndRatingStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ratingLabel, durationBackgroundView])
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [shadowBgView].forEach() { addSubview($0) }
        shadowBgView.setAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        [bgView].forEach() { shadowBgView.addSubview($0) }
        bgView.setAnchors(top: shadowBgView.topAnchor, leading: shadowBgView.leadingAnchor, bottom: shadowBgView.bottomAnchor, trailing: shadowBgView.trailingAnchor)
        
        [bgImageView, infoStackView, durationAndRatingStackView].forEach() { bgView.addSubview($0) }
        [recipeImage].forEach() { bgImageView.addSubview($0) }
        bgImageView.setAnchors(top: bgView.topAnchor, leading: bgView.leadingAnchor, bottom: bgView.bottomAnchor, trailing: bgView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0))
        recipeImage.setAnchors(top: bgImageView.topAnchor, leading: bgImageView.leadingAnchor, bottom: bgImageView.bottomAnchor, trailing: bgImageView.trailingAnchor)
        infoStackView.setAnchors(top: recipeImage.bottomAnchor, leading: bgView.leadingAnchor, bottom: bgView.bottomAnchor, trailing: bgView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
        durationAndRatingStackView.setAnchors(top: nil, leading: recipeImage.leadingAnchor, bottom: recipeImage.bottomAnchor, trailing: recipeImage.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 20, bottom: 5, right: 20), size: CGSize(width: 0, height: 35))
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
