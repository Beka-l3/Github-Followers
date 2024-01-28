//
//  FollowersListVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class FollowersListVCUIConfig {
    
    weak var rootView: UIView?
    
 
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: Constants.padding, left: Constants.padding, bottom: Constants.padding, right: Constants.padding)
        layout.itemSize = .init(width: Constants.cellWidth, height: Constants.cellHeight)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .systemBackground
//        view.backgroundColor = .systemBrown
        view.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        
        return view
    }()
}


extension FollowersListVCUIConfig {
    
    func configureUI() {
        guard let rootView = rootView else {
            // os log "no root view"
            return
        }
        
        rootView.backgroundColor = .systemBackground
        
        rootView.addSubview(collectionView)
    }
    
}


extension FollowersListVCUIConfig {
    
    func configureAutoLayout() {
        guard let rootView = rootView else {
            // os log "no root view"
            return
        }
        
        NSLayoutConstraint.activate([
            
        ])
        
    }
    
    func configureFrames() {
        guard let rootView = rootView else {
            // os log "no root view"
            return
        }
        
        collectionView.frame = rootView.bounds
    }
    
}


extension FollowersListVCUIConfig {
    
    enum Constants {
        
        static let viewWidth = UIScreen.main.bounds.width
        
        static let padding: CGFloat = 12
        
        static let amountOfColums: Int = 3
        static let minSapcingBtwnCC: CGFloat = 10
        static let availableSpaceForCC: CGFloat = viewWidth - 2 * padding - (CGFloat(amountOfColums)) * minSapcingBtwnCC
        static let cellWidth: CGFloat = availableSpaceForCC / CGFloat(amountOfColums)
        static let cellHeight: CGFloat = cellWidth + 40
        
    }
    
}
