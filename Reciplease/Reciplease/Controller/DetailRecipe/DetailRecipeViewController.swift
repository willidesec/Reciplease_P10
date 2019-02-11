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
    let infosView = RecipeInfosView()
    let ingredientTableView = UITableView()
    
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        guard let imageUrl = recipeDetail?.recipeInfos.images[0].hostedLargeUrl else {
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
        configureTableView()
        setupNavigationBar()
    }
    
    // MARK: - Action
    @objc func favoriteButtonDidTapped() {
        guard let recipeDetail = recipeDetail else { return }
        let favoriteRecipe = Recipe(context: AppDelegate.viewContext)
        favoriteRecipe.name = recipeDetail.recipeInfos.name
        try? AppDelegate.viewContext.save()
    }
    
    // MARK: - Methods
    fileprivate func setupNavigationBar() {
//        let favoriteButton: UIButton = {
//           let button = UIButton(type: .system)
//            button.setImage(UIImage(named: "heart"), for: .normal)
//            button.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
//            button.addTarget(self, action: #selector(favoriteButtonDidTapped), for: .touchUpInside)
//            return button
//        }()
//        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: favoriteButton)
//        favoriteButton.squareRatio()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "heart"), style: .plain, target: self, action: #selector(favoriteButtonDidTapped))
        
    }
    
    fileprivate func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        [recipeImageView, infosView, ingredientTableView].forEach() { view.addSubview($0) }        
        
        setConstraints()
        
        infosView.backgroundColor = .white
        infosView.addCornerRadius(of: 25)
        infosView.addShadow(width: 3, height: 3, radius: 10, opacity: 0.2)
        
        guard let recipeDetail = recipeDetail else { return }
        infosView.nameLabel.text = recipeDetail.recipeInfos.name
        infosView.detailView.durationLabel.text = recipeDetail.recipeInfos.totalTime
        let servings = String(recipeDetail.recipeInfos.numberOfServings)
        infosView.detailView.servingLabel.text = "\(servings) servings"
        
        if recipeDetail.recipeInfos.nutritionEstimates.isEmpty {
            infosView.detailView.energeticValueLabel.text = Constants.NO_VALUE
        } else {
            let calories = recipeDetail.recipeInfos.nutritionEstimates[0].value
            infosView.detailView.energeticValueLabel.text = "\(String(calories)) kcal"
        }
        
    }
    
    fileprivate func setConstraints() {
        let imageViewHeight = view.frame.height / 4
        recipeImageView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize(width: 0, height: imageViewHeight))
        
        infosView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: (imageViewHeight / 1.5), left: 15, bottom: 0, right: 15), size: CGSize(width: 0, height: imageViewHeight))
        
        infosView.nameLabel.setAnchors(top: infosView.topAnchor, leading: infosView.leadingAnchor, bottom: nil, trailing: infosView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: (imageViewHeight / 2) - 15))
        
        infosView.detailView.setAnchors(top: infosView.nameLabel.bottomAnchor, leading: infosView.leadingAnchor, bottom: infosView.bottomAnchor, trailing: infosView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20))
        
        ingredientTableView.setAnchors(top: infosView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeBottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15))
    }
    
    fileprivate func configureTableView() {
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
        ingredientTableView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.identifier)
        ingredientTableView.separatorStyle = .none
    }
    
    

}
