//
//  GFItemInfoView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 30.01.2024.
//

import UIKit


final class GFItemInfoView: UIView {
    
    enum ItemType: String {
        case repos          = "folder"
        case gists          = "text.alignleft"
        case followers      = "person.2"
        case following      = "heart"
        case none           = "circle"
    }
    
    
    lazy var systemImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: type.rawValue)
        view.tintColor = .label
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel = GFTitleLabel(alignment: .left, fontSize: 14)
    lazy var countLabel = GFTitleLabel(alignment: .center, fontSize: 14)
    
    private var type: ItemType = .none
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


extension GFItemInfoView {
    
    private func configure() {
        titleLabel.text = "Item"
        countLabel.text = "0"
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureAutoLayout() {
        NSLayoutConstraint.activate([
            systemImageView.topAnchor.constraint(equalTo: topAnchor),
            systemImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            systemImageView.heightAnchor.constraint(equalToConstant: Constants.systemImageDimension),
            systemImageView.widthAnchor.constraint(equalToConstant: Constants.systemImageDimension),
            
            titleLabel.centerYAnchor.constraint(equalTo: systemImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: systemImageView.trailingAnchor, constant: Constants.padding),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeight),
            
            countLabel.topAnchor.constraint(equalTo: systemImageView.bottomAnchor, constant: Constants.paddingS),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: Constants.countLabelHeight),
        ])
    }
}


extension GFItemInfoView {
    
    func setData(type: ItemType, count: Int) {
        self.type = type
        self.systemImageView.image = UIImage(systemName: type.rawValue)
        self.countLabel.text = "\(count)"
        
        switch type {
            
        case .repos:
            titleLabel.text = "Public Respos"
            
        case .gists:
            titleLabel.text = "Public Gists"
            
        case .followers:
            titleLabel.text = "Followers"
            
        case .following:
            titleLabel.text = "Following"
            
        case .none:
            titleLabel.text = "Item"
        }
    }
}


extension GFItemInfoView {
 
    enum Constants {
        static let paddingS:                    CGFloat     = 4
        static let padding:                     CGFloat     = 12
        static let titleLabelHeight:            CGFloat     = 18
        static let countLabelHeight:            CGFloat     = 18
        static let systemImageDimension:        CGFloat     = 20
        
        
        
        static let titleLabelTextDefault:       String      = "Item"
        static let countLabelTextDefault:       String      = "0"
    }
}
