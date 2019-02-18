//
//  IngredientCell.swift
//  Reciplease
//
//  Created by William on 27/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class IngredientCell: UITableViewCell {
        
    let bulletedLabel: UILabel = {
        let label = UILabel()
        label.text = "●"
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor.pinkThemeColor
        return label
    }()
    
    let ingredientLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [bulletedLabel, ingredientLabel].forEach() { addSubview($0) }
        
        bulletedLabel.setAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: nil, padding: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 0), size: CGSize(width: 25, height: 0))
        ingredientLabel.setAnchors(top: topAnchor, leading: bulletedLabel.trailingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 20))
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
