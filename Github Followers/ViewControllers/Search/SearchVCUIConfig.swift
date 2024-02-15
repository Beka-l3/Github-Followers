//
//  SearchVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 27.01.2024.
//

import UIKit

final class SearchVCUIConfig {
    
    weak var rootView: UIView?
    
    lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = Images.githubLogo
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: Constants.logoImageDimension),
            view.heightAnchor.constraint(equalToConstant: Constants.logoImageDimension),
        ])
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logoImageViewTopConstraint: NSLayoutConstraint?
    
    lazy var usernameTextField: GFTextField = .init(placeholder: Constants.usernamePlaceholder)
    lazy var callToActionButton: GFButton = .init(color: .systemGreen, title: Constants.callToActionText, systemImage: Images.System.person3)
}


extension SearchVCUIConfig {
 
    enum Constants {
        static let paddingXS:               CGFloat     = 20
        static let paddingS:                CGFloat     = 48
        static let padding:                 CGFloat     = 50
        static let paddingM:                CGFloat     = 80
        static let logoImageDimension:      CGFloat     = 200
        
        static let usernamePlaceholder:     String      = "Enter username"
        static let callToActionText:        String      = "Get Followers"
    }
}


extension SearchVCUIConfig {
    
    func configureUI() {
        guard let rootView = rootView else { return }
        
        rootView.backgroundColor = .systemBackground
        
        rootView.addSubviews(logoImageView, usernameTextField, callToActionButton)
    }
    
    
    func configureAutoLayout() {
        guard let rootView = rootView else { return }
        
        let padding = DeviceType.isiPhoneSE || DeviceType.isiPhone8Zoomed
        ? Constants.paddingXS
        : Constants.paddingM
        
        logoImageViewTopConstraint = logoImageView.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: padding)
        logoImageViewTopConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: Constants.paddingS),
            usernameTextField.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: Constants.padding),
            usernameTextField.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -Constants.padding),
            usernameTextField.heightAnchor.constraint(equalToConstant: Constants.padding),
            
            callToActionButton.heightAnchor.constraint(equalToConstant: Constants.padding),
            callToActionButton.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: Constants.padding),
            callToActionButton.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -Constants.padding),
            callToActionButton.bottomAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.bottomAnchor, constant: -Constants.padding),
        ])
    }
}


extension SearchVCUIConfig {
    
    func clearUsernameTF() {
        usernameTextField.text = .empty
    }
    
    
    func usernameTFShouldResignFR() {
        usernameTextField.resignFirstResponder()
    }
}
