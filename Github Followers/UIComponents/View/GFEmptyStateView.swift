//
//  GFEmptyStateView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFEmptyStateView: UIView {
    
    lazy var messageLabel = GFTitleLabel(alignment: .center, fontSize: 28)
    lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "empty-state-logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //    MARK: lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        self.messageLabel.text = message
    }
    
}


extension GFEmptyStateView {

    private func configure() {
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 200),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 140),
        ])
    }
        
}
