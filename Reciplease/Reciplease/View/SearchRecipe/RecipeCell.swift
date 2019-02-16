//
//  RecipeCell.swift
//  Reciplease
//
//  Created by William on 05/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    var recipe: Infos? {
        didSet {
            guard let data = recipe?.smallImageUrls[0].dropTwoLastAndReplaceWith("500").transformImageUrlToData() else { return }
            recipeImage.image = UIImage(data: data)
            nameLabel.text = recipe?.recipeName
            guard var timeInSeconds = recipe?.totalTimeInSeconds else { return }
            let timeString = timeInSeconds.convertSecondsToMinutes()
            durationLabel.text = timeString
            guard let rating = recipe?.rating else { return }
            ratingLabel.text = String(rating)
            guard let allIngredients = recipe?.ingredients else { return }
            // TODO: Majuscule sur les noms d'ingrédients
            let ingredientsText = allIngredients.joined(separator: ", ")
            ingredientLabel.text = ingredientsText
        }
    }
    
    // Background
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

    // Image
    let recipeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.7
        return imageView
    }()
    
    // Infos
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
    
    // Rating
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        label.textColor = UIColor.white
        return label
    }()
    
    let ratingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "ratingStar")
        return imageView
    }()
    
    lazy var ratingStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [ratingLabel, ratingImage])
        stack.distribution = .fill
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    // Duration
    let durationBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Background
        [shadowBgView].forEach() { addSubview($0) }
        shadowBgView.setAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
        [bgView].forEach() { shadowBgView.addSubview($0) }
        bgView.setAnchors(top: shadowBgView.topAnchor, leading: shadowBgView.leadingAnchor, bottom: shadowBgView.bottomAnchor, trailing: shadowBgView.trailingAnchor)
        
        [bgImageView].forEach() { bgView.addSubview($0) }
        bgImageView.setAnchors(top: bgView.topAnchor, leading: bgView.leadingAnchor, bottom: bgView.bottomAnchor, trailing: bgView.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0))
        
        // InfosStackView
        [infoStackView].forEach() { bgView.addSubview($0) }
        infoStackView.setAnchors(top: bgImageView.bottomAnchor, leading: bgView.leadingAnchor, bottom: bgView.bottomAnchor, trailing: bgView.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))

        // Image
        [recipeImage].forEach() { bgImageView.addSubview($0) }
        recipeImage.setAnchors(top: bgImageView.topAnchor, leading: bgImageView.leadingAnchor, bottom: bgImageView.bottomAnchor, trailing: bgImageView.trailingAnchor)
        
        // Rating
        [ratingStackView].forEach() { bgView.addSubview($0) }
        ratingStackView.setAnchors(top: nil, leading: recipeImage.leadingAnchor, bottom: recipeImage.bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 0), size: CGSize(width: 0, height: 30))
        ratingImage.squareRatio()
        
        // Duration
        [durationBackgroundView].forEach() { bgView.addSubview($0) }
        let bgHeight = 100
        durationBackgroundView.setAnchors(top: nil, leading: nil, bottom: recipeImage.bottomAnchor, trailing: recipeImage.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(-bgHeight / 2), right: 20), size: CGSize(width: 100, height: bgHeight))
        
        durationBackgroundView.addCornerRadius(of: CGFloat(bgHeight / 2))
        
        [durationLabel].forEach() {durationBackgroundView.addSubview($0) }
        durationLabel.setAnchors(top: durationBackgroundView.topAnchor, leading: durationBackgroundView.leadingAnchor, bottom: recipeImage.bottomAnchor, trailing: durationBackgroundView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 5, right: 20))
        
        bgView.bringSubviewToFront(infoStackView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
