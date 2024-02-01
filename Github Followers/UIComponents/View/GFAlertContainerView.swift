//
//  GFAlertContainerView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 01.02.2024.
//

import UIKit


final class GFAlertContainerView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
}


extension GFAlertContainerView {
    
    private func configure() {
        backgroundColor = .systemBackground
        
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = Constants.cornerRadius
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}


extension GFAlertContainerView {
    
    enum Constants {
        
        static let borderWidth:     CGFloat     = 2
        static let cornerRadius:    CGFloat     = 16
    }
}
