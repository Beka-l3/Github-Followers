//
//  UIViewController+SafariVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 31.01.2024.
//

import UIKit
import SafariServices


extension UIViewController {
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
}
