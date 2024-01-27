//
//  GFAlertVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFAlertVCUIConfig {
    
    weak var rootView: UIView?
    
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        
        view.layer.cornerRadius = 16
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel = GFTitleLabel(alignment: .center, fontSize: 20)
    lazy var messageLabel = GFBodyLabel(alignment: .center)
    lazy var actionButton = GFButton(backgroundColor: .systemPink, title: "OK")
    
}



extension GFAlertVCUIConfig {
    
    func configureUI() {
        guard let rootView = rootView else {
            // os log "no root view"
            return
        }
        
        rootView.backgroundColor = UIColor(white: 0, alpha: 0.75)
        
        messageLabel.numberOfLines = 4
        
        rootView.addSubview(containerView)
        rootView.addSubview(titleLabel)
        rootView.addSubview(actionButton)
        rootView.addSubview(messageLabel)
    }
    
}


extension GFAlertVCUIConfig {
    
    func configureAutoLayout() {
        guard let rootView = rootView else {
            // os log "no root view"
            return
        }
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: rootView.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 220),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 28),
            
            actionButton.heightAnchor.constraint(equalToConstant: 44),
            actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -Constants.padding),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.paddingS),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -Constants.paddingM),
        ])
        
    }
    
}

extension GFAlertVCUIConfig {
    enum Constants {
        
        static let paddingS: CGFloat = 8
        static let paddingM: CGFloat = 12
        static let padding: CGFloat = 20
    }
}
