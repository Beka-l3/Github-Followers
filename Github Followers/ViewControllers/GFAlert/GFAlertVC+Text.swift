//
//  GFAlertVC+Text.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 01.02.2024.
//

import Foundation


extension GFAlertVC {
    typealias AlertText = (title: String, message: String, buttonTitle: String)

    enum Text {
        
        static let defaultButton                          = "OK"
        static let defaultTitle                           = "Something went wrong"
        static let defaultMessage                         = "Unable to complete request"
        
        static let empty:               AlertText         = (.empty, .empty, .empty)
        static let emptyUsername:       AlertText         = ("Empty username", "Please enter a username. We need to know who search for 🙂", defaultButton)
    }
}
