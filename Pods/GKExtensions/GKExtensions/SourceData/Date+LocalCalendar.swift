//
//  Date+LocalCalendar.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

public extension Date {
    
    public func toLocalDateTimeString() -> String {
        let date = self
        
        let calendar = NSCalendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        // Return Example: 01.01.1999 08:30:00
        return "\(String(format: "%02d", day)).\(String(format: "%02d", month)).\(year) \(String(format: "%02d", hour)):\(String(format: "%02d", minute))"
    }
    
    public func toLocalDateTimeWordsString() -> String {
        let date = self
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM HH:mm"
        dateFormatter.locale = Locale.current
        
        // Return Example: 01 января 08:30
        return dateFormatter.string(from: date)
    }
    
    public func toLocalDateString() -> String {
        let date = self
        let calendar = NSCalendar.current
        
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        // Return Example: 01.01.1999
        return "\(String(format: "%02d", day)).\(String(format: "%02d", month)).\(year)"
    }
    
    public func toLocalWeekDayString() -> String {
        let date = self
        let calendar = NSCalendar.current
        
        let weekDay = calendar.component(.weekday, from: date)
        
        let formatter = DateFormatter()
        // Return Example: ПН
        return formatter.weekdaySymbols[weekDay - 1]
    }
    
    public func toLocalWeekDayIndex() -> Int {
        let date = self
        let calendar = NSCalendar.current
        
        let weekDay = calendar.component(.weekday, from: date)
        
        return weekDay - 1
    }
    
    public func toLocalTimeString() -> String {
        let date = self
        let calendar = NSCalendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        // Return Example: 08:30:00
        return "\(String(format: "%02d", hour)):\(String(format: "%02d", minute)):\(String(format: "%02d", second))"
    }
    
    public func toLocalTimeShortString() -> String {
        let date = self
        let calendar = NSCalendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        // Return Example: 08:30
        return "\(String(format: "%02d", hour)):\(String(format: "%02d", minute))"
    }
    
}
