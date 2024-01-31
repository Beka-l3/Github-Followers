//
//  UserInfoVC+GFItemInfoVCDelegate.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import UIKit
import SafariServices


extension UserInfoVC: GFItemInfoVCDelegate {
    
    func handleItemInfoButton(of type: GFItemInfoVC.InfoType) {
        
        switch type {
            
        case .projects:
            showSafariView()
            
        case .people:
            dismissAndPassNewUsername()
            
        default:
            break
            
        }
    }
    
    private func showSafariView() {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid", buttonTitle: "OK")
            return
        }
        
        presentSafariVC(with: url)
    }
    
    private func dismissAndPassNewUsername() {
        delegate?.getFollowers(for: user.login)
        dismiss(animated: true)
    }
}


