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
    lazy var usernameLabel = GFTitleLabel(alignment: .center, fontSize: Constants.usernameLabelFontSize)
    
    
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
        downloadAvatarImage(from: follower.avatarUrl)
    }
}
 

extension FollowerCell {
    
    private func downloadAvatarImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard error == nil else { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.avatarImageView.image = image
            }
        }
        
        task.resume()
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
