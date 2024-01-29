//
//  GFSecondaryTitleLabel.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 29.01.2024.
//

import UIKit


final class GFSecondaryTitleLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        self.font = .systemFont(ofSize: fontSize, weight: .medium)
    }
    
}


extension GFSecondaryTitleLabel {
    
    private func configure() {
        textColor = .label
        
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}



