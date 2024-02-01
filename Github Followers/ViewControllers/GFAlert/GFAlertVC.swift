//
//  GFAlertVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFAlertVC: UIViewController {
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?
    
    private let uiConfig: GFAlertVCUIConfig = .init()
    
    
//    MARK: lifecycle
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}


extension GFAlertVC {
    
    private func configure() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
        
        uiConfig.titleLabel.text        = alertTitle    ?? Text.defaultTitle
        uiConfig.messageLabel.text      = message       ?? Text.defaultMessage
        uiConfig.actionButton.setTitle(buttonTitle      ?? Text.defaultButton, for: .normal)
        
        uiConfig.actionButton.addTarget(self, action: #selector(handleOkButton), for: .touchUpInside)
    }
}


extension GFAlertVC {
    
    @objc func handleOkButton() {
        dismiss(animated: true)
    }
}
