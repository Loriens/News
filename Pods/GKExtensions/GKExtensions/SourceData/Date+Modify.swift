//
//  Date+Modify.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

public extension Date {
    
    public func addMinutes(_ minutesToAdd: Double) -> Date {
        let secondsInMinutes: TimeInterval = minutesToAdd * 60
        
        return self.addingTimeInterval(secondsInMinutes)
    }
    
    public func addHours(_ hoursToAdd: Double) -> Date {
        let secondsInHours: TimeInterval = hoursToAdd * 60 * 60
        
        return self.addingTimeInterval(secondsInHours)
    }
    
    public func addDays(_ daysToAdd: Double) -> Date {
        let secondsInDays: TimeInterval = daysToAdd * 60 * 60 * 24
        
        return self.addingTimeInterval(secondsInDays)
    }
    
}
