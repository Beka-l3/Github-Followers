//
//  UserInfoVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class UserInfoVCUIConfig {
    
    weak var rootView: UIView!
    
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var itemViewOne: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var itemViewTwo: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}



extension UserInfoVCUIConfig {
    
    func configureUI() {
        rootView.backgroundColor = .systemBackground
        
        rootView.addSubview(headerView)
    }
    
    func configureAutoLayout() {
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constants.headerHeight),
        ])
    }
}


extension UserInfoVCUIConfig {
    
    enum Constants {
        
        static let padding:         CGFloat     = 20
        static let headerHeight:    CGFloat     = 180
    }
}
