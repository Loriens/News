//
//  AppConfiguration.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AppConfiguration {
    
    static var serverURL: String {
        #if DEBUG
        return "https://jsonplaceholder.typicode.com"
        #else
        return "https://jsonplaceholder.typicode.com"
        #endif
    }
    
}
