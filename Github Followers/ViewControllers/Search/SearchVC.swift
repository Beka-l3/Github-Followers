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
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
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
            presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username. We need to know who search for 🙂", buttonTitle: "OK")
            return
        }
        
        let followersListVC = FollowersListVC()
        followersListVC.resetUsername(to: username)
        navigationController?.pushViewController(followersListVC, animated: true)
    }
}


extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
