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
        guard let data = recipeDetail?.recipeInfos.images[0].hostedLargeUrl.transformImageUrlToData() else { return UIImageView() }
        imageView.image = UIImage(data: data)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    let safariButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.redThemeColor
        button.setTitle(Constants.SAFARI_BUTTON_TITLE, for: .normal)
        button.titleLabel?.textColor = .white
        button.addCornerRadius(of: 5)
        button.addTarget(self, action: #selector(safariButtonDidTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureTableView()
        checkIfFavoriteRecipe()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkIfFavoriteRecipe()
    }
    
    // MARK: - Action
    @objc func favoriteButtonDidTapped() {
        !isFavoriteRecipe ? saveRecipeToFavorite() : unsaveRecipeToFavorite()
    }
    
    @objc func safariButtonDidTapped() {
        guard let source = recipeDetail?.recipeInfos.source.sourceRecipeUrl, let url = URL(string: source) else {
            displayAlert(title: Constants.Alert.ERROR_TITLE, message: Constants.Alert.ERROR_MESSAGE)
            return
        }
        UIApplication.shared.open(url)
    }
    
    // MARK: - Methods
    private func checkIfFavoriteRecipe() {
        guard let recipeName = recipeDetail?.recipeInfos.name else { return }
        isFavoriteRecipe = Recipe.checkIfEntityExist(recipeName: recipeName)
        isFavoriteRecipe ? setupNavigationBar(image: #imageLiteral(resourceName: "fillFavoriteButton")) : setupNavigationBar(image: #imageLiteral(resourceName: "favoriteButton"))
    }
    
    private func saveRecipeToFavorite() {
        guard let recipeDetail = recipeDetail else { return }
        let favoriteRecipe = Recipe(context: AppDelegate.viewContext)
        favoriteRecipe.name = recipeDetail.recipeInfos.name
        favoriteRecipe.duration = recipeDetail.recipeInfos.totalTime
        favoriteRecipe.rating = String(recipeDetail.recipeInfos.rating)
        favoriteRecipe.image = recipeDetail.recipeInfos.images[0].hostedLargeUrl.transformImageUrlToData()
        favoriteRecipe.calories = String(recipeDetail.recipeInfos.nutritionEstimates[0].value)
        favoriteRecipe.servings = String(recipeDetail.recipeInfos.numberOfServings)
        favoriteRecipe.source = recipeDetail.recipeInfos.source.sourceRecipeUrl

        
        for ingredient in recipeDetail.ingredients {
            let ingrendientEntity = Ingredient(context: AppDelegate.viewContext)
            ingrendientEntity.name = ingredient
            ingrendientEntity.recipe = favoriteRecipe
        }
        
        for instruction in recipeDetail.recipeInfos.ingredientLines {
            let instructionEntity = Instruction(context: AppDelegate.viewContext)
            instructionEntity.name = instruction
            instructionEntity.recipe = favoriteRecipe
        }
        
        try? AppDelegate.viewContext.save()
        isFavoriteRecipe = true
        navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "fillFavoriteButton")
    }
    
    private func unsaveRecipeToFavorite() {
        guard let recipeName = recipeDetail?.recipeInfos.name else { return }
        Recipe.deleteRecipe(recipeName: recipeName)
        isFavoriteRecipe = false
        navigationItem.rightBarButtonItem?.image = #imageLiteral(resourceName: "favoriteButton")
    }
    
}

// MARK: - Setup UI
extension DetailRecipeViewController {
    private func configureTableView() {
        ingredientTableView.dataSource = self
        ingredientTableView.delegate = self
        ingredientTableView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.identifier)
        ingredientTableView.separatorStyle = .none
    }
    
    private func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        [recipeImageView, infosView, ingredientTableView, safariButton].forEach() { view.addSubview($0) }
        
        setConstraints()
        
        infosView.backgroundColor = .white
        infosView.addCornerRadius(of: 25)
        infosView.addShadow(width: 3, height: 3, radius: 5, opacity: 0.2)
        
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
    
    private func setupNavigationBar(image: UIImage) {
        navigationItem.title = Constants.NavigationTitle.DETAILS
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(favoriteButtonDidTapped))
    }
    
    private func setConstraints() {
        let imageViewHeight = view.frame.height / 4
        recipeImageView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, size: CGSize(width: 0, height: imageViewHeight))
        
        infosView.setAnchors(top: view.safeTopAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: (imageViewHeight / 1.5), left: 15, bottom: 0, right: 15), size: CGSize(width: 0, height: imageViewHeight))
        
        infosView.nameLabel.setAnchors(top: infosView.topAnchor, leading: infosView.leadingAnchor, bottom: nil, trailing: infosView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: (imageViewHeight / 2) - 15))
        
        infosView.detailView.setAnchors(top: infosView.nameLabel.bottomAnchor, leading: infosView.leadingAnchor, bottom: infosView.bottomAnchor, trailing: infosView.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20))
        
        ingredientTableView.setAnchors(top: infosView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeBottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 15, bottom: 50, right: 15))
        
        safariButton.setAnchors(top: ingredientTableView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeBottomAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 75, bottom: 10, right: 75))
    }
}
