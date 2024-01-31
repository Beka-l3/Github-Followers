//
//  FavoriteCell.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import UIKit


final class FavoriteCell: UITableViewCell {
    
    static let reuseId = "FavoriteCellReuseId"
    
    lazy var avatarImageView = GFAvatarImageView(frame: .zero)
    lazy var usernameLabel = GFTitleLabel(alignment: .left, fontSize: Constants.usernameLabelFontSize)
    
    
//    MARK: lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


// MARK: exposed func
extension FavoriteCell {
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.imageUrl = favorite.avatarUrl
    }
}


extension FavoriteCell {
    
    private func configure() {
        accessoryType = .disclosureIndicator
        
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.padding),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.avatarImageDimension),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.avatarImageDimension),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: Constants.avatarImageDimension),
        ])
    }
}


extension FavoriteCell {
    
    enum Constants {
        
        static let padding:                     CGFloat     = 12
        static let paddingM:                    CGFloat     = 16
        static let avatarImageDimension:        CGFloat     = 60
        static let usernameLabelFontSize:       CGFloat     = 26
        static let usernameLabelHeight:         CGFloat     = 40
    }
}

    

