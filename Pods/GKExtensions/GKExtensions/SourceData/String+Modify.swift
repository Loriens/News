//
//  String+Modify.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    
    public func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    public func replace(_ target: String, with: String) -> String {
        return self.replacingOccurrences(of: target, with: with, options: NSString.CompareOptions.literal, range: nil)
    }
    
}
