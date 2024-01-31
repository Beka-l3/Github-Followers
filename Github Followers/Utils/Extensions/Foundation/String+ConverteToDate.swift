//
//  String+ConvertToDate.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 30.01.2024.
//

import Foundation


extension String {
    
    func converteToDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        
        return formatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = converteToDate() else { return "N/A" }
        return date.convertToMothYearFormat()
    }
}
