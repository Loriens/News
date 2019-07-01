//
//  AppThemeManager.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum AppThemeType: String {
    case light = "THEME_LIGHT"
    case dark = "THEME_DARK"
    
    static let base: AppThemeType = .light
    
    init(value: String?) {
        if let value = value {
            switch value {
            case AppThemeType.light.rawValue:
                self = .light
            case AppThemeType.dark.rawValue:
                self = .dark
            default:
                self = AppThemeType.base
            }
        } else {
            self = AppThemeType.base
        }
    }
    
    var key: String {
        return self.rawValue
    }
    
    var title: String {
        switch self {
        case .light:
            return AppLocalization.Theme.light.localized
        case .dark:
            return AppLocalization.Theme.dark.localized
        }
    }
}

class AppThemeManager {
    
    // MARK: - Setup prop
    private static var currentTheme: AppThemeManager {
        let storedThemeData = UserDefaults.standard.string(forKey: AppDefaults.activeTheme)
        let storedTheme = AppThemeType(value: storedThemeData)
        
        if storedThemeData == nil {
            UserDefaults.standard.set(storedTheme.key, forKey: AppDefaults.activeTheme)
        }
        
        return AppThemeManager(currentType: storedTheme)
    }
    
    // MARK: - Initialization
    private init(currentType: AppThemeType) {
        self.currentType = currentType
    }
    
    // MARK: - Accessor
    public static var current: AppThemeManager {
        return self.currentTheme
    }
    
    // MARK: - Supported themes
    public static var list: [AppThemeType] {
        return [.light, .dark]
    }
    
    // MARK: - Props
    private var currentType: AppThemeType
    
    public var type: AppThemeType {
        return self.currentType
    }
    
    // MARK: - Public functions
    public func change(theme type: AppThemeType) {
        UserDefaults.standard.set(type.key, forKey: AppDefaults.activeTheme)
    }
    
}
