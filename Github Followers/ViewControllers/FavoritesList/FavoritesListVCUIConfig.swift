//
//  FavoritesListVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import UIKit


final class FavoritesListVCUIConfig {
    
    weak var rootView: UIView!
    
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .systemBackground
        view.rowHeight = Constants.rowHeight
        view.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseId)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}


extension FavoritesListVCUIConfig {
    
    func configureUI() {
        rootView.backgroundColor = .systemBackground
        
        rootView.addSubview(tableView)
    }
    
    func configureFrames() {
        tableView.frame = rootView.bounds
    }
}

extension FavoritesListVCUIConfig {
 
    enum Constants {
        
        static let rowHeight:       CGFloat     = 80
    }
}