//
//  UIView+AddSubviews.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 13.02.2024.
//

import UIKit


extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
