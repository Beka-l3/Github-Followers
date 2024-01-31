//
//  Date+Converter.swift
//  Github Followers
//
//  Created by Bekzhan Talgat on 30.01.2024.
//

import Foundation


extension Date {
    
    func convertToMothYearFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM YYYY"
        
        return formatter.string(from: self)
    }
}
