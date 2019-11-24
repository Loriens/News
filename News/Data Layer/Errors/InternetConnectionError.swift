//
//  InternetConnectionError.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct InternetConnectionError: LocalizedError {
    
    var errorDescription: String? {
        return AppLocalization.Error.internetConnectionError.localized
    }
    
}
