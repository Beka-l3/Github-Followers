//
//  GFTitleLabel.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFTitleLabel: UILabel {
    
    enum TitleType {
        case first(alignment: NSTextAlignment)
        case secondary
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(type: TitleType, fontSize: CGFloat, textColor: UIColor = .label) {
        self.init(frame: .zero)
        
        var weight: UIFont.Weight = .bold
        
        switch type {
            
        case let .first(alignment):
            self.textAlignment = alignment
            
        case .secondary:
            weight = .medium
            
        }
        
        self.font = .systemFont(ofSize: fontSize, weight: weight)
        self.textColor = textColor
    }
}


extension GFTitleLabel {
    
    private func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
