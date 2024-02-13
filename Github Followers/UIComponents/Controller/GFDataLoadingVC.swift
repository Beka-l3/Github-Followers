//
//  GFDataLoadingVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 13.02.2024.
//

import UIKit


class GFDataLoadingVC: UIViewController {
    
    var containerView: UIView?
    private(set) var isLoading: Bool = false
    
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
    func showLoadingView() {
        isLoading = true
        containerView = UIView(frame: view.bounds)
        guard let containerView = containerView else { return }
        
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
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])
        
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        isLoading = false
        containerView?.removeFromSuperview()
        containerView = nil
    }
}

