//
//  DetailView.swift
//  Reciplease
//
//  Created by William on 20/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    let timeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "clock")
        return imageView
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    lazy var durationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timeImageView, durationLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let servingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "serving")
        return imageView
    }()
    
    let servingLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var servingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [servingImageView, servingLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let energeticValueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage(named: "kcal")
        return imageView
    }()
    
    let energeticValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    lazy var energeticValueStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [energeticValueImageView, energeticValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var detailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [durationStackView, servingStackView, energeticValueStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [detailStackView].forEach() { addSubview($0) }
        detailStackView.setAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        timeImageView.squareRatio()
        servingImageView.squareRatio()
        energeticValueImageView.squareRatio()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
