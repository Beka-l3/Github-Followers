//
//  GFButton.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 27.01.2024.
//

import UIKit

final class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    convenience init(color: UIColor, title: String, systemImage image: UIImage? = nil) {
        self.init(frame: .zero)
        
        set(color: color, title: title, systemImage: image)
    }
    
}


extension GFButton {
    
    enum Constants {
        static let imagePadding:        CGFloat     = 6
    }
}


extension GFButton {
    
    private func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        configuration?.imagePadding = Constants.imagePadding
        configuration?.imagePlacement = .leading
        translatesAutoresizingMaskIntoConstraints = false
    }
}


extension GFButton {
    
    func set(color: UIColor, title: String, systemImage image: UIImage? = nil) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title
        
        configuration?.image = image
        
    }
}
