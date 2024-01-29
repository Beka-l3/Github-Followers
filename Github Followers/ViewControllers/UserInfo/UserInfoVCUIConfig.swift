//
//  UserInfoVCUIConfig.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class UserInfoVCUIConfig {
    
    weak var rootView: UIView?
    
    
    
}



extension UserInfoVCUIConfig {
    
    func configureUI() {
        guard let rootView = rootView else {
            // os log "no root view"
            return
        }
        
        rootView.backgroundColor = .systemBackground
        
        
    }
    
    func configureAutoLayout() {
//        guard let rootView = rootView else {
        guard let _ = rootView else {
            // os log "no root view"
            return
        }
        
        NSLayoutConstraint.activate([
            
        ])
    }
    
}
