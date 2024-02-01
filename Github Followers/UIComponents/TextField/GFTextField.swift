//
//  GFTextField.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 27.01.2024.
//

import UIKit


final class GFTextField: UITextField {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
}


extension GFTextField {
    
    private func configure() {
        layer.cornerRadius          = Constants.cornerRadius
        layer.borderWidth           = Constants.borderWidth
        layer.borderColor           = UIColor.systemGray4.cgColor
                
        textColor                   = .label
        tintColor                   = .label
        backgroundColor             = .tertiarySystemBackground
        
        textAlignment               = .center
        font                        = .preferredFont(forTextStyle: .title2)
        minimumFontSize             = Constants.minimumFontSize
        adjustsFontSizeToFitWidth   = true
        
        returnKeyType               = .go
        autocorrectionType          = .no
        clearButtonMode             = .whileEditing
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}


extension GFTextField {
 
    enum Constants {
        
        static let cornerRadius:            CGFloat     = 10
        static let borderWidth:             CGFloat     = 2
        static let minimumFontSize:         CGFloat     = 12
    }
}
