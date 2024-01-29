//
//  GFUserInfoHeaderVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 29.01.2024.
//

import UIKit


final class GFUserInfoHeaderVC: UIViewController {
    
    private var user: User!
    
    private let uiConfig = GFUserInfoHeaderVCUIConfig()
    
    
    
    //    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
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

extension GFUserInfoHeaderVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
    }
    
}
