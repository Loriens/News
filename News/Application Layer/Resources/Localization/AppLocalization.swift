//
//  AppLocalization.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

enum AppLocalization {
    enum General: String, Localizable {
        case ok = "OK"
        case save = "Save"
        case cancel = "Cancel"
        case close = "Close"
        case unknown = "Unknown"
        case loading = "Loading"
        case refresh = "Refresh"
        case tryAgain = "TryAgain"
        case error = "Error"
    }
    
    enum Error: String, Localizable {
        case unknown = "UnknownError"
        
        enum Post: String, Localizable {
            case emptyPost = "EmptyPostError"
        }
    }
    
    enum PostList: String, Localizable {
        case title = "PostListTitle"
        case empty = "PostListEmpty"
    }
    
    enum Post: String, Localizable {
        case title = "PostTitle"
        case empty = "PostEmpty"
    }
}
