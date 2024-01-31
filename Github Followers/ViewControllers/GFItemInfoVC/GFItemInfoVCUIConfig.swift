//
//  GFItemInfoVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 30.01.2024.
//

import UIKit


final class GFItemInfoVCUIConfig {
    
    weak var rootView: UIView!
    
    
    lazy var itemInfoOne = GFItemInfoView()
    lazy var itemInfoTwo = GFItemInfoView()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.addArrangedSubview(itemInfoOne)
        view.addArrangedSubview(itemInfoTwo)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var button = GFButton()
    
}


extension GFItemInfoVCUIConfig {
    
    func configureUI() {
        rootView.backgroundColor = .secondarySystemBackground
        rootView.layer.cornerRadius = Constants.cornerRadius
        
        rootView.addSubview(stackView)
        rootView.addSubview(button)
    }
    
    func configureAutoLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: rootView.topAnchor, constant: Constants.padding),
            stackView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: Constants.padding),
            stackView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -Constants.padding),
            stackView.heightAnchor.constraint(equalToConstant: Constants.stackHeight),
            
            button.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
            button.leadingAnchor.constraint(equalTo: rootView.leadingAnchor, constant: Constants.padding),
            button.trailingAnchor.constraint(equalTo: rootView.trailingAnchor, constant: -Constants.padding),
            button.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: -Constants.padding),
        ])
    }
    
    func configureInfoType(type: GFItemInfoVC.InfoType) {
        
        switch type {
            
        case let .projects(respos, gists):
            itemInfoOne.setData(type: .repos, count: respos)
            itemInfoTwo.setData(type: .gists, count: gists)
            button.backgroundColor = .systemPurple
            button.setTitle(Constants.projectsButtonTitle, for: .normal)
            
        case let .people(following, followers):
            itemInfoOne.setData(type: .following, count: following)
            itemInfoTwo.setData(type: .followers, count: followers)
            button.backgroundColor = .systemGreen
            button.setTitle(Constants.peopleButtonTitle, for: .normal)
            
        case .none:
            break
            
        }
    }
}


extension GFItemInfoVCUIConfig {
    
    enum Constants {
        
        static let padding:                 CGFloat     = 20
        static let cornerRadius:            CGFloat     = 10
        static let stackHeight:             CGFloat     = 50
        static let buttonHeight:            CGFloat     = 44
        
        static let projectsButtonTitle:     String      = "Github Profile"
        static let peopleButtonTitle:       String      = "Get Followers"
    }
}