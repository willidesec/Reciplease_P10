//
//  DetailRecipeViewController.swift
//  Reciplease
//
//  Created by William on 19/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class DetailRecipeViewController: UIViewController {
    
    // MARK: - Properties
    var recipeDetail: RecipeDetail?
    
    // MARK: - View
    let recipeInfosView = RecipeInfosView()
    
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        guard let imageUrl = recipeDetail?.images[0].hostedLargeUrl else {
            return UIImageView()
        }
        guard let url = URL(string: imageUrl) else {
            return UIImageView()
        }
        guard let data = try? Data(contentsOf: url) else {
            return UIImageView()
        }
        imageView.image = UIImage(data: data)
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    // MARK: - Methods
    fileprivate func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        [recipeImageView, recipeInfosView].forEach() { view.addSubview($0) }
        
        let imageViewHeight = view.frame.height / 4
        recipeImageView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize(width: 0, height: imageViewHeight))
        

        recipeInfosView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: (imageViewHeight / 1.5), left: 15, bottom: 0, right: 15), size: CGSize(width: 0, height: imageViewHeight))
        
        recipeInfosView.nameLabel.setAnchors(top: recipeInfosView.topAnchor, leading: recipeInfosView.leadingAnchor, bottom: nil, trailing: recipeInfosView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: (imageViewHeight / 2) - 15))
        
        recipeInfosView.detailView.setAnchors(top: recipeInfosView.nameLabel.bottomAnchor, leading: recipeInfosView.leadingAnchor, bottom: recipeInfosView.bottomAnchor, trailing: recipeInfosView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 25, bottom: 15, right: 25))
        
        
        recipeInfosView.backgroundColor = .white
        recipeInfosView.addCornerRadius(of: 25)
        recipeInfosView.addShadow(width: 3, height: 3, radius: 10, opacity: 0.2)
        
        guard let recipeDetail = recipeDetail else { return }
        recipeInfosView.nameLabel.text = recipeDetail.name
        
        recipeInfosView.detailView.durationLabel.text = recipeDetail.totalTime
        let servings = String(recipeDetail.numberOfServings)
        recipeInfosView.detailView.servingLabel.text = "\(servings) servings"
        let calories = String(recipeDetail.nutritionEstimates[0].value)
        recipeInfosView.detailView.energeticValueLabel.text = "\(calories) kcal"
        
    }

}
