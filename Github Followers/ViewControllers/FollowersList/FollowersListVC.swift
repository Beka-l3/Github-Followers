//
//  FollowersListVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit

final class FollowersListVC: GFDataLoadingVC {
    
    private(set) var isSearching:           Bool        = false
    private(set) var hasMoreFollowers:      Bool        = false
    private(set) var page:                  Int         = 1
    
    private(set) var username:              String
    
    private(set) var followers:             [Follower]  = []
    private(set) var filteredFollowers:     [Follower]  = []
    
    private let uiConfig:                   FollowersListVCUIConfig     = .init()
    
    private typealias Diffable = UICollectionViewDiffableDataSource<Section, Follower>
    private lazy var dataSource: Diffable = .init( collectionView: uiConfig.collectionView ) { collectionView, indexPath, follower in
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as? FollowerCell {
            cell.set(follower: follower)
            return cell
        }
        
        return .init()
    }
    
    
//    MARK: lifecycle
    init(username: String) {
        self.username = username
        super.init(nibName: nil, bundle: nil)
        title = username
    }
    
    
    required init?(coder: NSCoder) {
        self.username = .empty
        super.init(coder: coder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureNavbar()
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
    
    override func updateContentUnavailableConfiguration(using state: UIContentUnavailableConfigurationState) {
        if followers.isEmpty {
            /// here I want to use EmptyStateView
            contentUnavailableConfiguration = nil
        } else if isSearching && filteredFollowers.isEmpty {
//            contentUnavailableConfiguration = UIContentUnavailableConfiguration.noFollowersInSearch
            contentUnavailableConfiguration = UIContentUnavailableConfiguration.search()
        } else {
            contentUnavailableConfiguration = nil
        }
    }
}


extension FollowersListVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        
        uiConfig.collectionView.delegate = self
        uiConfig.searchController.searchResultsUpdater = self
        uiConfig.searchController.searchBar.delegate = self
    }
    
    
    private func configureNavbar() {
        navigationItem.searchController = uiConfig.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToFavorites))
        navigationItem.rightBarButtonItem = addButton
    }
    
    
    private func resetData() {
        self.page = 1
        self.followers = []
        self.filteredFollowers = []
        updateData(on: [])
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
        self.username = username
        title = username
        resetData()
    }
}
