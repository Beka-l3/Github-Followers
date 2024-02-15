//
//  UIViewController+Show.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit

extension UIViewController {
    
    func presentGFAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
        presentGFAlert(alertVC: alertVC)
    }
    
    func presentDefaultErrorAlert() {
        let alertVC = GFAlertVC(
            title: "Something went wrong",
            message: "We were unable to complete your task at this time. Please, try again later",
            buttonTitle: "OK"
        )
        
        presentGFAlert(alertVC: alertVC)
    }
    
    private func presentGFAlert(alertVC: GFAlertVC) {
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        present(alertVC, animated: true)
    }
}
