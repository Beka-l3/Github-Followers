//
//  UIViewController+ActivityIndicator.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


fileprivate var containerView: UIView!


extension UIViewController {
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        view.addSubview(containerView)
        
        UIView.animate(withDuration: 0.25) {
            containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        containerView.removeFromSuperview()
        containerView = nil
    }
    
}
