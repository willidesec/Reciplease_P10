//
//  ActivityIndicatorView.swift
//  Reciplease
//
//  Created by William on 13/01/2019.
//  Copyright © 2019 William Désécot. All rights reserved.
//

import UIKit

class LoadingScreen {
    
    // MARK: - Properties
    let bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.alpha = 0.0
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
    var window: UIWindow?
    
    // MARK: - Init
    init() {
        setConstraints()
    }
    
    // MARK: - Methods
    func startLoading() {
        window = UIApplication.shared.keyWindow
        window?.addSubview(bgView)
        guard let frame = window?.frame else { return }
        bgView.frame = frame
        UIView.animate(withDuration: 0.5) {
            self.bgView.alpha = 1.0
        }
    }
    
    func stopLoading() {
        if window != nil {
            UIView.animate(withDuration: 0.2, animations: {
                self.bgView.alpha = 0.0
            }) { _ in
                self.window = nil
            }
        }
    }
}

extension LoadingScreen {
    private func setConstraints() {
        bgView.addSubview(activityIndicator)
        activityIndicator.center(to: bgView)
    }
}
