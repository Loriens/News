//
//  AppConfiguration.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AppConfiguration {
    
    static var serverUrl: String {
        guard let serverUrl = Bundle.main.infoDictionary?["ServerUrl"] as? String else {
            return ""
        }
        return serverUrl
    }
    
}
