//
//  GFConstants.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 01.02.2024.
//

import UIKit

enum SFSymbols: String {
    
    case folder             = "folder"
    case textAlignLeft      = "text.alignleft"
    case person2            = "person.2"
    case heart              = "heart"
    case circle             = "circle"
    case mapAndEllipse      = "mappin.and.ellipse"
}


enum Images {
    
    static let githubLogo               = UIImage(named: "gh-logo")
    static let avatarPlaceholder        = UIImage(named: "avatar-placeholder")
    static let emptyStateLogo           = UIImage(named: "empty-state-logo")
    
    enum System {
        
        static let repos                = UIImage(systemName: SFSymbols.folder.rawValue)
        static let gists                = UIImage(systemName: SFSymbols.textAlignLeft.rawValue)
        static let followers            = UIImage(systemName: SFSymbols.person2.rawValue)
        static let following            = UIImage(systemName: SFSymbols.heart.rawValue)
        static let location             = UIImage(systemName: SFSymbols.mapAndEllipse.rawValue)
        static let none                 = UIImage(systemName: SFSymbols.circle.rawValue)
    }
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
