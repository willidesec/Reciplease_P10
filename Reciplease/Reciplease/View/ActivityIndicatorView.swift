//
//  ActivityIndicatorView.swift
//  Reciplease
//
//  Created by William on 13/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class ActivityIndicatorView: UIView {
    
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        [bgView].forEach() { addSubview($0) }
        
        bgView.setAnchors(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
