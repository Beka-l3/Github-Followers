//
//  GFItemInfoVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 30.01.2024.
//

import UIKit


protocol GFItemInfoVCDelegate: AnyObject {
    func handleItemInfoButton(sender: UIButton)
}


final class GFItemInfoVC: UIViewController {
    
    enum InfoType {
        case projects(repos: Int, gists: Int)
        case people(following: Int, followers: Int)
        case none
    }
    
    weak var delegate: GFItemInfoVCDelegate?
    
    private(set) var type: InfoType = .none
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
        
        uiConfig.button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
    }
}


extension GFItemInfoVC {
    
    func setType(_ type: InfoType) {
        self.type = type
        uiConfig.configureInfoType(type: type)
        
        switch type {
        
        case .projects:
            uiConfig.button.tag = 1
            
        case .people:
            uiConfig.button.tag = 2
            
        case .none:
            break
            
        }
    }
}


extension GFItemInfoVC {
    
    @objc func handleButton(sender: UIButton) {
        delegate?.handleItemInfoButton(sender: sender)
    }
    
}
