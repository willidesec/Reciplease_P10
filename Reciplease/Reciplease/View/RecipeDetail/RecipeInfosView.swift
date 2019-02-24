//
//  RecipeDetailView.swift
//  Reciplease
//
//  Created by William on 19/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class RecipeInfosView: UIView {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let detailView = DetailView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [nameLabel, detailView].forEach() { addSubview($0) }

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
