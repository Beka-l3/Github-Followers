//
//  FollowerCell.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCellReuseID"
    
    lazy var avatarImageView = GFAvatarImageView(frame: .zero)
    lazy var usernameLabel = GFTitleLabel(type: .first(alignment: .center), fontSize: Constants.usernameLabelFontSize)
    
    
//    MARK: lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


// MARK: exposed func
extension FollowerCell {
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.imageUrl = follower.avatarUrl
    }
}


extension FollowerCell {
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.padding),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding),
            avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Constants.paddingM),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.paddingM),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.paddingM),
            usernameLabel.heightAnchor.constraint(equalToConstant: Constants.usernameLabelHeight)
        ])
    }
}


extension FollowerCell {
    
    enum Constants {
        
        static let padding: CGFloat = 8
        static let paddingM: CGFloat = 12
        
        static let usernameLabelFontSize: CGFloat = 16
        static let usernameLabelHeight: CGFloat = 20
    }
}
