//
//  GFItemInfoVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 30.01.2024.
//

import UIKit


final class GFItemInfoVC: UIViewController {
    
    private let uiConfig = GFItemInfoVCUIConfig()
    
    
//    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
}


extension GFItemInfoVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
    }
}
