//
//  UserInfoVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class UserInfoVC: UIViewController {
    
    var follower: Follower!
    
    private var user: User! { didSet { headerVC.user = user } }
    
    private let uiConfig = UserInfoVCUIConfig()
    private let headerVC = GFUserInfoHeaderVC()
    private let itemInfoVCOne = GFItemInfoVC()
    private let itemInfoVCTwo = GFItemInfoVC()
    
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
}


extension UserInfoVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func configureNavbar() {
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    private func configureInfo() {
        headerVC.avatarUrl = follower.avatarUrl
        itemInfoVCOne.setType(.projects(repos: user.publicRepos, gists: user.publicGists))
        itemInfoVCTwo.setType(.people(following: user.following, followers: user.followers))
        uiConfig.setDate(dateString: user.createdAt)
    }
    
    private func configureViewControllers() {
        add(childVC: headerVC, to: uiConfig.headerView)
        add(childVC: itemInfoVCOne, to: uiConfig.itemViewOne)
        add(childVC: itemInfoVCTwo, to: uiConfig.itemViewTwo)
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
                configureInfo()
                configureViewControllers()
                
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
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
