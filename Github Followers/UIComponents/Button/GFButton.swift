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
    
    
    convenience init(backgroundColor: UIColor, title: String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
}


extension GFButton {
    
    enum Constants {
        static let cornerRadius:        CGFloat     = 10
    }
}


extension GFButton {
    
    private func configure() {
        layer.cornerRadius = Constants.cornerRadius
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
