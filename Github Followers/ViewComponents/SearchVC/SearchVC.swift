//
//  SearchVC.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 27.01.2024.
//

import UIKit

class SearchVC: UIViewController {

    private let uiConfig: SearchVCUIConfig = .init()
    
    
//    MARK: lifecycle
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }


}

extension SearchVC {
    
    private func configureVC() {
        uiConfig.rootView = view
        uiConfig.configureUI()
        uiConfig.configureAutoLayout()
        
        uiConfig.usernameTextField.delegate = self
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing)))
    }
    
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
}
