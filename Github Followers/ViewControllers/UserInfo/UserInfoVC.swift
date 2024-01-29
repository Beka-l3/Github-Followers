//
//  UserInfoVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class UserInfoVC: UIViewController {
    
    
    var follower: Follower!
    
    private var user: User!
    
    private let uiConfig = UserInfoVCUIConfig()
    
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
}

extension UserInfoVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
        navigationItem.rightBarButtonItem = doneButton
        
    }
    
}


extension UserInfoVC {
    
    @objc func handleDoneButton() {
        dismiss(animated: true)
    }
    
}

extension UserInfoVC {
    
    private func fetchUser() {
        Task {
            
            do {
                let user = try await NetworkManager.shared.getUser(for: follower.login)
                
                print(user)
                
            } catch {
                print(error)
                print(error.localizedDescription)
            }
            
        }
    }
    
}
