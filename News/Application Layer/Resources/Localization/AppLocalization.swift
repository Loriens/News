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
        case attention = "Attention"
        case unknown = "Unknown"
        case loading = "Loading"
        case refresh = "Refresh"
        case tryAgain = "TryAgain"
        case wipTitle = "WipTitle"
        case wipText = "WipText"
        case errorTitle = "Error"
        case errorLoading = "ErrorLoading"
        case errorUnknown = "ErrorUnknown"
    }
    
    enum Theme: String, Localizable {
        case light = "AppThemeLight"
        case dark = "AppThemeDark"
    }
    
    enum Language: String, Localizable {
        case english = "AppLanguageEnglish"
        case russian = "AppLanguageRussian"
    }
    
    enum List: String, Localizable {
        case title = "ListNavigationTitle"
        case empty = "ListEmptyPlaceholder"
    }
    
    enum Detail: String, Localizable {
        case title = "DetailNavigationTitle"
        case empty = "DetailEmptyPlaceholder"
    }
    
}
