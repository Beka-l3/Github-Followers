//
//  UserInfoVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class UserInfoVC: UIViewController {
    
    
    var follower: Follower!
    
    private var user: User! {
        didSet {
            headerVC.user = user
        }
    }
    
    private let uiConfig = UserInfoVCUIConfig()
    private let headerVC = GFUserInfoHeaderVC()
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureNavbar()
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
        
        configureViewControllers()
    }
    
    private func configureNavbar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    private func configureViewControllers() {
        add(childVC: headerVC, to: uiConfig.headerView)
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
                user = try await NetworkManager.shared.getUser(for: follower.login)
                headerVC.avatarUrl = follower.avatarUrl
            } catch {
                print(error, error.localizedDescription, separator: "\n")
            }
        }
    }
}


extension UserInfoVC {
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.frame
        childVC.didMove(toParent: self)
    }
}
