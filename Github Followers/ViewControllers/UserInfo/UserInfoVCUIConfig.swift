//
//  UserInfoVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class UserInfoVCUIConfig {
    
    weak var rootView: UIView?
    
    
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
    
    lazy var dateLabel = GFBodyLabel(alignment: .center)
    
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
        guard let rootView = rootView else { return }
        rootView.backgroundColor = .systemBackground
        
        rootView.addSubview(scrollView)
        
        scrollView.addSubviews(headerView, itemViewOne, itemViewTwo, dateLabel)
    }
    
    func configureAutoLayout() {
        guard let rootView = rootView else { return }
        
        scrollView.pinToEdges(of: rootView)
        
        NSLayoutConstraint.activate([
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
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: Constants.padding),
            dateLabel.centerXAnchor.constraint(equalTo: scrollView.contentLayoutGuide.centerXAnchor),
            dateLabel.heightAnchor.constraint(equalToConstant: Constants.dateLabelHeight),
            
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Constants.padding),
        ])
    }
}


extension UserInfoVCUIConfig {
    
    func setDate(dateString: String) {
        dateLabel.text = Constants.dateLabelPrefix + dateString.convertToDisplayFormat()
    }
    
    func setDate(date: Date) {
        dateLabel.text = Constants.dateLabelPrefix + date.convertToMothYearFormat()
    }
}


extension UserInfoVCUIConfig {
    
    enum Constants {
        
        static let padding:                     CGFloat     = 20
        static let headerHeight:                CGFloat     = 210
        static let itemViewHeight:              CGFloat     = 140
        static let dateLabelHeight:             CGFloat     = 50
        
        static let scrollViewContentHeight:     CGFloat     = headerHeight + 2 * itemViewHeight + 3 * padding
        
        static let dateLabelPrefix:              String     = "Github since "
    }
}
