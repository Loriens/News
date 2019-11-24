//
//  AppLocalization.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AppLocalization {
    
    enum General: String {
        case ok = "OK"
        case save = "Save"
        case cancel = "Cancel"
        case close = "Close"
        case attention = "Attention"
        case unknown = "Unknown"
        case loading = "Loading"
        case refresh = "Refresh"
        case tryAgain = "TryAgain"
        case errorTitle = "Error"
        case errorLoading = "ErrorLoading"
        case errorUnknown = "ErrorUnknown"
    }
    
    enum Errors: String {
        case internetConnectionError = "InternetConnectionError"
    }
    
    enum PostList: String {
        case title = "ListNavigationTitle"
        case empty = "ListEmptyPlaceholder"
    }
    
    enum Post: String {
        case title = "DetailNavigationTitle"
        case empty = "DetailEmptyPlaceholder"
    }
    
}
