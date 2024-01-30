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
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
}


extension UserInfoVCUIConfig {
    
    func configureUI() {
        rootView.backgroundColor = .systemBackground
        
        rootView.addSubview(scrollView)
        
        scrollView.addSubview(headerView)
        scrollView.addSubview(itemViewOne)
        scrollView.addSubview(itemViewTwo)
    }
    
    func configureAutoLayout() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: rootView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: rootView.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: rootView.bottomAnchor),
            
            scrollView.contentLayoutGuide.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollView.contentLayoutGuide.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollView.contentLayoutGuide.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            
            headerView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: Constants.headerHeight),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: Constants.padding),
            itemViewOne.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: Constants.padding),
            itemViewOne.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -Constants.padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: Constants.headerHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: Constants.padding),
            itemViewTwo.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: Constants.padding),
            itemViewTwo.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -Constants.padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: Constants.headerHeight),
            
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: Constants.padding),
        ])
    }
}


extension UserInfoVCUIConfig {
    
    enum Constants {
        
        static let padding:                     CGFloat     = 20
        static let headerHeight:                CGFloat     = 180
        static let itemViewHeight:              CGFloat     = 140
        
        static let scrollViewContentHeight:     CGFloat     = headerHeight + 2 * itemViewHeight + 3 * padding
    }
}
