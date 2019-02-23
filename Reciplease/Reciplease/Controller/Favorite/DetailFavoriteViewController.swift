//
//  DetailFavoriteViewController.swift
//  Reciplease
//
//  Created by William on 16/02/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class DetailFavoriteViewController: UIViewController {
    
    // MARK: - Properties
    var recipe: Recipe
    
    // MARK: - View
    let infosView = RecipeInfosView()
    let ingredientTableView = UITableView()
    lazy var recipeImageView: UIImageView = {
        let imageView = UIImageView()
        guard let imageData = recipe.image else { return UIImageView() }
        imageView.image = UIImage(data: imageData)
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
    
    // MARK: - Init
    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureTableView()
        setupNavigationBar(image: #imageLiteral(resourceName: "fillFavoriteButton"))
    }
    
    // MARK: - Action
    @objc func favoriteButtonDidTapped() {
        unsaveRecipeToFavorite()
    }
    
    @objc func safariButtonDidTapped() {
        guard let source = recipe.source, let url = URL(string: source) else {
            print("error")
            return
        }
        UIApplication.shared.open(url)
    }
    
    // MARK: - Methods
    private func unsaveRecipeToFavorite() {
        guard let recipeName = recipe.name else { return }
        Recipe.deleteRecipe(recipeName: recipeName)
        navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - Setup UI
extension DetailFavoriteViewController {
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
        
        infosView.nameLabel.text = recipe.name
        infosView.detailView.durationLabel.text = recipe.duration
        guard let servings = recipe.servings else { return }
        infosView.detailView.servingLabel.text = "\(servings) servings"
        
        guard let calories = recipe.calories else {
            infosView.detailView.energeticValueLabel.text = Constants.NO_VALUE
            return
        }
        infosView.detailView.energeticValueLabel.text = "\(calories) kcal"
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
