//
//  GFAvatarImageView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFAvatarImageView: UIImageView {
        
    var imageUrl: String? {
        didSet {
            if let imageUrl {
                downloadAvatarImage(from: imageUrl)
            } else {
                image = Constants.placeholderImage
            }
        }
    }
    
    private let cache = NetworkService.shared.cache
    
    
//    MARK: lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


extension GFAvatarImageView {
    
    enum Constants {
        static let cornerRadius:        CGFloat     = 10
        static let placeholderImage:    UIImage?    = Images.avatarPlaceholder
    }
}


extension GFAvatarImageView {
    
    private func configure() {
        layer.cornerRadius = Constants.cornerRadius
        clipsToBounds = true
        image = Constants.placeholderImage
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
                do { image = await NetworkService.shared.getImage(from: urlString) }
            }
        }
    }
}
