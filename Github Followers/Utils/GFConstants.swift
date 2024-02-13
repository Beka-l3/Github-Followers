//
//  GFConstants.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 01.02.2024.
//

import UIKit


enum Images {
    
    static let githubLogo               = UIImage(named: "gh-logo")
    static let avatarPlaceholder        = UIImage(named: "avatar-placeholder")
    static let emptyStateLogo           = UIImage(named: "empty-state-logo")
}

enum ScreenSize {
    
    static let width                    = UIScreen.main.bounds.width
    static let height                   = UIScreen.main.bounds.height
    static let maxLength                = max(width, height)
    static let minLength                = min(width, height)
}

enum DeviceType {
    
    static let idiom                    = UIDevice.current.userInterfaceIdiom
    static let nativeScale              = UIScreen.main.nativeScale
    static let scale                    = UIScreen.main.scale
    
    static let isiPhoneSE               = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard        = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed          = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard    = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed      = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX                = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr       = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad                   = idiom == .pad   && ScreenSize.maxLength >= 1024.0
    
    static func isiPhoneAscpectRatio() -> Bool {
        isiPhoneX || isiPhoneXsMaxAndXr
    }
}
