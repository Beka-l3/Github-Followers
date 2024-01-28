//
//  FollowersListVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit
//import OSLog


final class FollowersListVC: UIViewController {
    
    var username: String!
    
    
    private var isFetching: Bool = false
    private var isAnimating: Bool = false {
        didSet {
            // handle showing loading animation
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isFetching, !isAnimating {
            isAnimating = true
        }
    }
    
    
}


extension FollowersListVC {
    
    private func fetchFollowers() {
        Task {
            isFetching = true
            
            do {
                let followers = try await NetworkManager.shared.getFollowers(for: username, page: 1)
                
                print(followers.count, "\n")
                
                followers.forEach { follower in
                    print(follower)
                }
                
            } catch {
                
                var message = "Something went wrong"
                
                if let error = error as? NetworkManager.ServiceError {
                    message = error.rawValue
                }
                
                presentGFAlertOnMainThread(title: "Got an error", message: message, buttonTitle: "OK")
                // os log: "error", error, error.localizedDescription
                
            }
            
            isFetching = false
            isAnimating = false
        }
    }
    
}
