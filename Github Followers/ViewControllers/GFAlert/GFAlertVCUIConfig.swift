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
        
        view.layer.borderWidth = Constants.borderWidth
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = Constants.cornerRadius
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel = GFTitleLabel(alignment: .center, fontSize: Constants.titleLabelFontSize)
    lazy var messageLabel = GFBodyLabel(alignment: .center)
    lazy var actionButton = GFButton(backgroundColor: .systemPink, title: GFAlertVC.Text.defaultButton)
}


extension GFAlertVCUIConfig {
    
    func configureUI() {
        guard let rootView = rootView else { return }
        
        rootView.backgroundColor = Constants.bgColor
        
        messageLabel.numberOfLines = Constants.messageNumberOfLines
        
        rootView.addSubview(containerView)
        rootView.addSubview(titleLabel)
        rootView.addSubview(actionButton)
        rootView.addSubview(messageLabel)
    }
    
    func configureAutoLayout() {
        guard let rootView = rootView else { return }
        
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
        
        static let messageNumberOfLines:        Int             = 4
        
        static let paddingS:                    CGFloat         = 8
        static let paddingM:                    CGFloat         = 12
        static let padding:                     CGFloat         = 20
        static let cornerRadius:                CGFloat         = 16
        static let borderWidth:                 CGFloat         = 2
        
        static let titleLabelFontSize:          CGFloat         = 20
        
        static let bgColor:                     UIColor?        = UIColor(white: 0, alpha: 0.75)
        
    }
}
