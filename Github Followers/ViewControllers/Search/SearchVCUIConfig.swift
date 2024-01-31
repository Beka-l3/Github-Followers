//
//  SearchVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 27.01.2024.
//

import UIKit
//import OSLog


final class SearchVCUIConfig {
    
    weak var rootView: UIView!
    
    
    lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "gh-logo")
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: 200),
            view.heightAnchor.constraint(equalToConstant: 200),
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var usernameTextField: GFTextField = .init(placeholder: "Enter username")
    
    lazy var callToActionButton: GFButton = .init(backgroundColor: .systemGreen, title: "Get Followers")
}


extension SearchVCUIConfig {
    
    func configureUI() {
        rootView.backgroundColor = .systemBackground
        
        rootView.addSubview(logoImageView)
        rootView.addSubview(usernameTextField)
        rootView.addSubview(callToActionButton)
    }
}


extension SearchVCUIConfig {
    
    func configureAutoLayout() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            callToActionButton.heightAnchor.constraint(equalToConstant: 50),
            callToActionButton.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: 50),
            callToActionButton.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -50),
            callToActionButton.bottomAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.bottomAnchor, constant: -50),
        ])
    }
}
