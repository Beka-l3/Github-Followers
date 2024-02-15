//
//  GFEmptyStateView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit

final class GFEmptyStateView: UIView {
    
    lazy var messageLabel = GFTitleLabel(type: .first(alignment: .center), fontSize: Constants.messageLabelFontSize)
    lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = Images.emptyStateLogo
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
//    MARK: lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    convenience init(message: String) {
        self.init(frame: .zero)
        self.messageLabel.text = message
    }
    
}


extension GFEmptyStateView {
    
    enum Constants {
        static let numberOfLines:                   Int         = 3
        
        static let padding:                         CGFloat     = 40
        static let paddingM:                        CGFloat     = 80
        static let paddingL:                        CGFloat     = 150
        static let paddingXL:                       CGFloat     = 170
        static let widthMultiplier:                 CGFloat     = 1.3
        static let messageLabelHeight:              CGFloat     = 200
        static let messageLabelFontSize:            CGFloat     = 28
    }
}


extension GFEmptyStateView {

    private func configure() {
        messageLabel.numberOfLines = Constants.numberOfLines
        messageLabel.textColor = .secondaryLabel
        
        addSubviews(messageLabel, logoImageView)
        
        let labelContraintYConstant = DeviceType.isiPhoneSE || DeviceType.isiPhone8Zoomed ? Constants.paddingM : Constants.paddingL
        let logoContraintBottomConstant = DeviceType.isiPhoneSE || DeviceType.isiPhone8Zoomed ? Constants.paddingM : Constants.padding
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -labelContraintYConstant),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            messageLabel.heightAnchor.constraint(equalToConstant: Constants.messageLabelHeight),
            
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier),
            logoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: Constants.widthMultiplier),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.paddingXL),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: logoContraintBottomConstant),
        ])
    }
}
