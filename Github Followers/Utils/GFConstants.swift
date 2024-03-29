//
//  GFConstants.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 01.02.2024.
//

import UIKit

enum SFSymbols: String {
    case star                           = "star"
    case folder                         = "folder"
    case textAlignLeft                  = "text.alignleft"
    case person                         = "person"
    case person2                        = "person.2"
    case person3                        = "person.3"
    case personSlash                    = "person.slash"
    case heart                          = "heart"
    case circle                         = "circle"
    case mapAndEllipse                  = "mappin.and.ellipse"
    case checkmark                      = "checkmark.circle"
}


enum Images {
    static let githubLogo               = UIImage(resource: .ghLogo)
    static let avatarPlaceholder        = UIImage(resource: .avatarPlaceholder)
    static let emptyStateLogo           = UIImage(resource: .emptyStateLogo)
    
    enum System {
        static let star                 = UIImage(systemName: SFSymbols.star.rawValue)
        static let repos                = UIImage(systemName: SFSymbols.folder.rawValue)
        static let gists                = UIImage(systemName: SFSymbols.textAlignLeft.rawValue)
        static let followers            = UIImage(systemName: SFSymbols.person2.rawValue)
        static let person               = UIImage(systemName: SFSymbols.person.rawValue)
        static let person3              = UIImage(systemName: SFSymbols.person3.rawValue)
        static let personSlash          = UIImage(systemName: SFSymbols.personSlash.rawValue)
        static let following            = UIImage(systemName: SFSymbols.heart.rawValue)
        static let location             = UIImage(systemName: SFSymbols.mapAndEllipse.rawValue)
        static let none                 = UIImage(systemName: SFSymbols.circle.rawValue)
        static let ok                   = UIImage(systemName: SFSymbols.checkmark.rawValue)
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
