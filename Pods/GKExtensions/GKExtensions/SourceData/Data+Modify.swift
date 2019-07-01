//
//  Data+Modify.swift
//  Trade Union
//
//  Created by  Кирилл on 1/16/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

public extension Data {
    
    mutating public func append(_ string: String) {
        if let data = string.data(using: .utf8) {
            append(data)
        }
    }
    
}
