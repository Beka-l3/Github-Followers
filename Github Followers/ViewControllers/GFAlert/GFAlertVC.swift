//
//  GFAlertVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 28.01.2024.
//

import UIKit


final class GFAlertVC: UIViewController {
    
    var alertTitle:     String
    var message:        String
    var buttonTitle:    String
    
    private let uiConfig: GFAlertVCUIConfig = .init()
    
    
//    MARK: lifecycle
    init(title: String = Text.defaultTitle, message: String = Text.defaultMessage, buttonTitle: String = Text.defaultButton) {
        self.alertTitle     = title
        self.message        = message
        self.buttonTitle    = buttonTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.alertTitle     = Text.defaultTitle
        self.message        = Text.defaultMessage
        self.buttonTitle    = Text.defaultButton
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
        uiConfig.setTitles(title: alertTitle, message: message, button: buttonTitle)
        uiConfig.actionButton.addTarget(self, action: #selector(handleOkButton), for: .touchUpInside)
    }
}


extension GFAlertVC {
    
    @objc func handleOkButton() {
        dismiss(animated: true)
    }
}
