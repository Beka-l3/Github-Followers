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
    
    private var followers: [Follower] = []
    private lazy var dataSource: UICollectionViewDiffableDataSource<Section, Follower> = .init(
        collectionView: uiConfig.collectionView
    ) { collectionView, indexPath, follower in
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
        cell.set(follower: follower)
        return cell
    }
    
    private var page: Int = 1
    private var hasMoreFollowers: Bool = false
    
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}


extension FollowersListVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        
        uiConfig.collectionView.delegate = self
        uiConfig.searchController.searchResultsUpdater = self
        
        navigationItem.searchController = uiConfig.searchController
    }
    
}


extension FollowersListVC {
    
    private func fetchFollowers() {
        showLoadingView()
        
        Task {
            do {
                followers += try await NetworkManager.shared.getFollowers(for: username, page: page)
                
                if followers.isEmpty {
                    showEmptyStateView(with: "This user does not haveany followers. So, go follow them 🙃", in: view)
                    return
                }
                
                updateData()
                
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


extension FollowersListVC {
    
    enum Section {
        case main
    }
    
}


extension FollowersListVC {
    
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
}


extension FollowersListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            guard hasMoreFollowers else { return }
            fetchFollowers()
        }
    }
    
}


extension FollowersListVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
}
