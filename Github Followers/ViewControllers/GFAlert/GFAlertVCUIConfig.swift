//
//  GFAlertVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFAlertVCUIConfig {
    
    weak var rootView: UIView?
    
    lazy var containerView = GFAlertContainerView()
    lazy var titleLabel = GFTitleLabel(type: .first(alignment: .center), fontSize: Constants.titleLabelFontSize)
    lazy var messageLabel = GFBodyLabel(alignment: .center)
    lazy var actionButton = GFButton(backgroundColor: .systemPink, title: GFAlertVC.Text.defaultButton)
}


extension GFAlertVCUIConfig {
    
    func configureUI() {
        guard let rootView = rootView else { return }
        rootView.backgroundColor = Constants.bgColor
        
        messageLabel.numberOfLines = Constants.messageNumberOfLines
        
        rootView.addSubviews(containerView, titleLabel, actionButton, messageLabel)
    }
    
    func configureAutoLayout() {
        guard let rootView = rootView else { return }
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: rootView.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: Constants.containerWidth),
            containerView.heightAnchor.constraint(equalToConstant: Constants.containerHeight),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.padding),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeight),
            
            actionButton.heightAnchor.constraint(equalToConstant: Constants.actionButtonHeight),
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
    
    func setTitles(title: String, message: String, button: String) {
        titleLabel.text = title
        messageLabel.text = message
        actionButton.setTitle(button, for: .normal)
    }
}


extension GFAlertVCUIConfig {
    enum Constants {
        
        static let messageNumberOfLines:        Int             = 4
        
        static let paddingS:                    CGFloat         = 8
        static let paddingM:                    CGFloat         = 12
        static let padding:                     CGFloat         = 20
        static let containerWidth:              CGFloat         = 280
        static let containerHeight:             CGFloat         = 220
        
        static let titleLabelFontSize:          CGFloat         = 20
        static let titleLabelHeight:            CGFloat         = 28
        static let actionButtonHeight:          CGFloat         = 44
        
        static let bgColor:                     UIColor?        = UIColor.black.withAlphaComponent(0.75)
    }
}
