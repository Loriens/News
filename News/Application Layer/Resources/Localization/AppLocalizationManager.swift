//
//  AppLocalizationManager.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum AppLocalizationType: String {
    case english = "LOCALIZATION_ENG"
    case russian = "LOCALIZATION_RUS"
    
    static let base: AppLocalizationType = .russian
    
    init(value: String?) {
        if let value = value {
            switch value {
            case AppLocalizationType.english.rawValue:
                self = .english
            case AppLocalizationType.russian.rawValue:
                self = .russian
            default:
                self = AppLocalizationType.base
            }
        } else {
            self = AppLocalizationType.base
        }
    }
    
    init(languageKey: String?) {
        if let languageKey = languageKey {
            switch languageKey {
            case AppLocalizationType.english.languageKey:
                self = .english
            case AppLocalizationType.russian.languageKey:
                self = .russian
            default:
                self = AppLocalizationType.base
            }
        } else {
            self = AppLocalizationType.base
        }
    }
    
    var key: String {
        return self.rawValue
    }
    
    var languageKey: String {
        switch self {
        case .english:
            return "en"
        case .russian:
            return "ru-RU"
        }
    }
    
    var localizationKey: String {
        switch self {
        case .english:
            return "en"
        case .russian:
            return "ru"
        }
    }
    
    var title: String {
        switch self {
        case .english:
            return AppLocalization.Language.english.localized
        case .russian:
            return AppLocalization.Language.russian.localized
        }
    }
}

class AppLocalizationManager {
    
    // MARK: - Setup prop
    private static var currentLocalization: AppLocalizationManager {
        let storedLocalizationData = UserDefaults.standard.string(forKey: AppDefaults.activeLocalization)
        
        if storedLocalizationData == nil {
            //            let preferredLanguage = NSLocale.preferredLanguages.first
            let preferredLanguage = "Russian"
            let preferredLocalization = AppLocalizationType(languageKey: preferredLanguage)
            
            return AppLocalizationManager(currentType: preferredLocalization)
        } else {
            let storedLocalization = AppLocalizationType(value: storedLocalizationData)
            
            return AppLocalizationManager(currentType: storedLocalization)
        }
    }
    
    // MARK: - Initialization
    private init(currentType: AppLocalizationType) {
        self.currentType = currentType
    }
    
    // MARK: - Accessor
    public static var current: AppLocalizationManager {
        return self.currentLocalization
    }
    
    // MARK: - Supported localizations
    public static var list: [AppLocalizationType] {
        return [.english, .russian]
    }
    
    // MARK: - Props
    private var currentType: AppLocalizationType
    
    public var type: AppLocalizationType {
        return self.currentType
    }
    
    // MARK: - Public functions
    public func change(localization type: AppLocalizationType) {
        UserDefaults.standard.set(type.key, forKey: AppDefaults.activeLocalization)
    }
}
