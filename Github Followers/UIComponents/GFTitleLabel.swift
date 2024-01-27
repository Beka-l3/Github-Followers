//
//  GFTitleLabel.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFTitleLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(_ title: String, alignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        
        self.text = title
        self.textAlignment = alignment
        self.font = .systemFont(ofSize: fontSize, weight: .bold)
    }
    
}


extension GFTitleLabel {
    
    private func configure() {
        textColor = .label
        
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byWordWrapping
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
