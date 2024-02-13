//
//  GFItemInfoView.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 30.01.2024.
//

import UIKit


final class GFItemInfoView: UIView {
    
    enum ItemType {
        case repos
        case gists
        case followers
        case following
        case none
    }
    
    
    lazy var systemImageView: UIImageView = {
        let view = UIImageView()
        view.image = Images.System.none
        view.tintColor = .label
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel = GFTitleLabel(type: .first(alignment: .left), fontSize: Constants.titleLabelFontSize)
    lazy var countLabel = GFTitleLabel(type: .first(alignment: .center), fontSize: Constants.countLabelFontSize)
    
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
        titleLabel.text = Constants.titleLabelTextDefault
        countLabel.text = Constants.countLabelTextDefault
        
        addSubviews(systemImageView, titleLabel, countLabel)
        
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
        self.countLabel.text = "\(count)"
        
        switch type {
            
        case .repos:
            titleLabel.text = Constants.reposTitleText
            self.systemImageView.image = Images.System.repos
            
        case .gists:
            titleLabel.text = Constants.gistsTitleText
            self.systemImageView.image = Images.System.gists
            
        case .followers:
            titleLabel.text = Constants.followersTitleText
            self.systemImageView.image = Images.System.followers
            
        case .following:
            titleLabel.text = Constants.followingTitleText
            self.systemImageView.image = Images.System.following
            
        case .none:
            titleLabel.text = Constants.titleLabelTextDefault
            self.systemImageView.image = Images.System.none
        }
    }
}


extension GFItemInfoView {
 
    enum Constants {
        static let paddingS:                    CGFloat     = 4
        static let padding:                     CGFloat     = 12
        static let titleLabelFontSize:          CGFloat     = 15
        static let titleLabelHeight:            CGFloat     = 18
        static let countLabelFontSize:          CGFloat     = 15
        static let countLabelHeight:            CGFloat     = 18
        static let systemImageDimension:        CGFloat     = 20
        
        static let titleLabelTextDefault:       String      = "Item"
        static let countLabelTextDefault:       String      = "0"
        static let reposTitleText:              String      = "Public Respos"
        static let gistsTitleText:              String      = "Public Gistss"
        static let followingTitleText:          String      = "Following"
        static let followersTitleText:          String      = "Followers"
    }
}
