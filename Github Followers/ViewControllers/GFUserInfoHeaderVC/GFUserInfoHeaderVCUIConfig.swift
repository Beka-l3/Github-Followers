//
//  GFUserInfoHeaderVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 29.01.2024.
//

import UIKit


final class GFUserInfoHeaderVCUIConfig {
    
    weak var rootView: UIView!
    
    lazy var avatarImageView = GFAvatarImageView(frame: .zero)
    lazy var usernameLabel = GFTitleLabel(alignment: .left, fontSize: 34)
    lazy var nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    
    lazy var locationImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: Constants.locationIconName)
        view.tintColor = .secondaryLabel
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    lazy var bioLabel = GFBodyLabel(alignment: .left)
    
}



extension GFUserInfoHeaderVCUIConfig {
    
    func configureUI() {
        rootView.backgroundColor = .clear
        
        rootView.addSubview(avatarImageView)
        rootView.addSubview(usernameLabel)
        rootView.addSubview(nameLabel)
        rootView.addSubview(locationImageView)
        rootView.addSubview(locationLabel)
        rootView.addSubview(bioLabel)
        
        bioLabel.numberOfLines = Constants.numberOfLineForBio
    }
    
    func configureAutoLayout() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: Constants.padding),
            avatarImageView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: Constants.padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.avatarImageDimension),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarImageDimension),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.textImagePadding),
//            usernameLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -Constants.padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: Constants.usernameLabelHeight),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: Constants.nameLabelYPadding),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.textImagePadding),
//            nameLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -Constants.padding),
            nameLabel.heightAnchor.constraint(equalToConstant: Constants.usernameLabelHeight),
            
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: Constants.locationIconDimension),
            locationImageView.heightAnchor.constraint(equalToConstant: Constants.locationIconDimension),
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: Constants.iconTextPadding),
//            locationLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -Constants.padding),
            locationLabel.heightAnchor.constraint(equalToConstant: Constants.locationLabelHeight),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Constants.textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
//            bioLabel.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -Constants.padding),
            bioLabel.heightAnchor.constraint(equalToConstant: Constants.bioLabelHeigh),
        ])
    }
}


extension GFUserInfoHeaderVCUIConfig {
    
    enum Constants {
        
        static let numberOfLineForBio:      Int         = 3
        
        static let padding:                 CGFloat     = 20
        static let textImagePadding:        CGFloat     = 12
        static let iconTextPadding:         CGFloat     = 5
        static let avatarImageDimension:    CGFloat     = 90
        static let usernameLabelHeight:     CGFloat     = 38
        static let nameLabelHeight:         CGFloat     = 20
        static let locationLabelHeight:     CGFloat     = 20
        static let nameLabelYPadding:       CGFloat     = 8
        static let locationIconDimension:   CGFloat     = 20
        static let bioLabelHeigh:           CGFloat     = 60
        
        static let locationIconName:        String      = "mappin.and.ellipse"
    }
}
