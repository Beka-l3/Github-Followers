//
//  GFAvatarImageView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFAvatarImageView: UIImageView {
    
    let placeholderImage = UIImage(named: "avatar-placeholder")
    
    var imageUrl: String? {
        didSet {
            if let imageUrl = imageUrl {
                downloadAvatarImage(from: imageUrl)
            } else {
                image = placeholderImage
            }
        }
    }
    
    private let cache = NetworkService.shared.cache
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}


extension GFAvatarImageView {
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}


extension GFAvatarImageView {
    
    private func downloadAvatarImage(from urlString: String) {
        
        if let image = cache.object(forKey: NSString(string: urlString)) {
            
            self.image = image
            
        } else {
            
            image = .avatarPlaceholder
            
            Task {
                do {
                    image = try await NetworkService.shared.getImage(from: urlString)
                }
            }
        }
    }
}
