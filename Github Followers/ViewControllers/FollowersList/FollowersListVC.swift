//
//  FollowersListVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class FollowersListVC: UIViewController {
    
    var username: String!
    
    private(set) var isSearching:           Bool        = false
    private(set) var hasMoreFollowers:      Bool        = false
    private(set) var page:                  Int         = 1
    private(set) var followers:             [Follower]  = []
    private(set) var filteredFollowers:     [Follower]  = []
    
    private let uiConfig:                   FollowersListVCUIConfig     = .init()
    
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
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToFavorites))
        navigationItem.rightBarButtonItem = addButton
    }
}


extension FollowersListVC {
    
    func applySnapshot(_ snapshot: NSDiffableDataSourceSnapshot<Section, Follower>) {
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    func appendToFavorites(_ array: [Follower]) {
        followers += array
    }
    
    func setHasMoreFollowers(_ newValue: Bool) {
        hasMoreFollowers = newValue
    }
    
    func incrementPage() {
        page += 1
    }
    
    func setFilteredFollowers(_ newValue: [Follower]) {
        self.filteredFollowers = newValue
    }
    
    func setIsSearching(_ newValue: Bool) {
        isSearching = newValue
    }
    
    func resetUsername(to username: String) {
        self.page = 1
        self.username = username
        self.followers = []
        self.filteredFollowers = []
//        uiConfig.collectionView.setContentOffset(.zero, animated: true)
        updateData(on: [])
        title = username
    }
}

