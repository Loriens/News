//
//  Localizable.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

protocol Localizable: RawRepresentable { }

extension Localizable {
    var key: String {
        return rawValue as? String ?? ""
    }

    var localized: String {
        return NSLocalizedString(key, comment: "")
    }
}
