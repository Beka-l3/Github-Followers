//
//  SearchVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 27.01.2024.
//

import UIKit

class SearchVC: UIViewController {

    private let uiConfig: SearchVCUIConfig = .init()
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        uiConfig.clearUsernameTF()
    }
}


extension SearchVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
        
        uiConfig.usernameTextField.delegate = self
        uiConfig.callToActionButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
    }
}


extension SearchVC {
    
    @objc func pushFollowersListVC() {
        guard let username = uiConfig.usernameTextField.text, !username.isEmpty else {
            presentGFAlertOnMainThread(
                title: GFAlertVC.Text.emptyUsername.title,
                message: GFAlertVC.Text.emptyUsername.message,
                buttonTitle: GFAlertVC.Text.emptyUsername.buttonTitle
            )
            
            return
        }
        
        uiConfig.usernameTFShouldResignFR()
        navigationController?.pushViewController(FollowersListVC(username: username), animated: true)
    }
}


extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
