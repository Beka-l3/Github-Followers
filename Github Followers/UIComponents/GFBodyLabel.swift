//
//  GFBodyLabel.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFBodyLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(_ text: String, alignment: NSTextAlignment) {
        self.init(frame: .zero)
        
        self.text = text
        self.textAlignment = alignment
    }
    
}


extension GFBodyLabel {
    
    private func configure() {
        textColor = .secondaryLabel
        
        font = .preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

    
}
