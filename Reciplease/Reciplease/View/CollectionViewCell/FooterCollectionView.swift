//
//  FooterCollectionView.swift
//  Reciplease
//
//  Created by William on 15/12/2018.
//  Copyright © 2018 William Désécot. All rights reserved.
//

import UIKit

class FooterCollectionView: UICollectionReusableView {
    
    let label: UILabel = {
       let label = UILabel()
        label.text = "Your fridge is empty 😢\n"
                    + "Add some food !"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FooterCollectionView {
    private func setConstraints() {
        addSubview(label)
        label.setAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
}

extension FooterCollectionView {
    static var identifier: String {
        return String(describing: self)
    }
}
