//
//  FollowerCell.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit
import SwiftUI

final class FollowerCell: UICollectionViewCell {
    
    static let reuseID = "FollowerCellReuseID"

        
//    MARK: lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


extension FollowerCell {
    
    func set(follower: Follower) {
        contentConfiguration = UIHostingConfiguration { FollowerView(follower: follower) }
    }
}
