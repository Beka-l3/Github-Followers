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
    
    private let uiConfig = FollowersListVCUIConfig()
    
    private(set) var page: Int = 1
    private(set) var hasMoreFollowers: Bool = false
    private(set) var followers: [Follower] = []
    private(set) var filteredFollowers: [Follower] = []
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Follower> = .init(
        collectionView: uiConfig.collectionView
    ) { collectionView, indexPath, follower in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
        cell.set(follower: follower)
        return cell
    }
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        fetchFollowers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        uiConfig.configureFrames()
    }
    
}


extension FollowersListVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        
        uiConfig.collectionView.delegate = self
        uiConfig.searchController.searchResultsUpdater = self
        uiConfig.searchController.searchBar.delegate = self
        
        navigationItem.searchController = uiConfig.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}


extension FollowersListVC {
    
    func applySnapshot(_ snapshot: NSDiffableDataSourceSnapshot<Section, Follower>) {
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func setFilteredFollowers(_ filteredFollowers: [Follower]) {
        self.filteredFollowers = filteredFollowers
    }
    
}


extension FollowersListVC {
    
    func fetchFollowers() {
        showLoadingView()
        
        Task {
            do {
                followers += try await NetworkManager.shared.getFollowers(for: username, page: page)
                
                if followers.isEmpty {
                    showEmptyStateView(with: "This user does not haveany followers. So, go follow them 🙃", in: view)
                    return
                }
                
                updateData(on: followers)
                hasMoreFollowers = followers.count >= NetworkManager.shared.perPage
                page += 1
                
            } catch {
                
                var message = "Something went wrong"
                if let error = error as? NetworkManager.ServiceError {
                    message = error.rawValue
                }
                
                presentGFAlertOnMainThread(title: "Got an error", message: message, buttonTitle: "OK")
                // os log: "error", error, error.localizedDescription
            }
            
            dismissLoadingView()
        }
    }
    
}
