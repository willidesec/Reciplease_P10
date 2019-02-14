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
    var isFavoriteRecipe = false
    
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
        !isFavoriteRecipe ? saveRecipeToFavorite() : unsaveRecipeToFavorite()
    }
    
    // MARK: - Methods
    private func configureTableView() {
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
        ingredientTableView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.identifier)
        ingredientTableView.separatorStyle = .none
    }
    
    private func saveRecipeToFavorite() {
        guard let recipeDetail = recipeDetail else { return }
        let favoriteRecipe = Recipe(context: AppDelegate.viewContext)
        favoriteRecipe.name = recipeDetail.recipeInfos.name
        try? AppDelegate.viewContext.save()
        isFavoriteRecipe = true
        navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "fillHeart")
    }
    
    private func unsaveRecipeToFavorite() {
        Recipe.deleteAll()
        isFavoriteRecipe = false
        navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "heart")
    }
    
}

// MARK: - Setup UI
extension DetailRecipeViewController {
    private func setupUI() {
        
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
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "heart"), style: .plain, target: self, action: #selector(favoriteButtonDidTapped))
    }
    
    private func setConstraints() {
        let imageViewHeight = view.frame.height / 4
        recipeImageView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize(width: 0, height: imageViewHeight))
        
        infosView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: (imageViewHeight / 1.5), left: 15, bottom: 0, right: 15), size: CGSize(width: 0, height: imageViewHeight))
        
        infosView.nameLabel.setAnchors(top: infosView.topAnchor, leading: infosView.leadingAnchor, bottom: nil, trailing: infosView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: (imageViewHeight / 2) - 15))
        
        infosView.detailView.setAnchors(top: infosView.nameLabel.bottomAnchor, leading: infosView.leadingAnchor, bottom: infosView.bottomAnchor, trailing: infosView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20))
        
        ingredientTableView.setAnchors(top: infosView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeBottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15))
    }
}
