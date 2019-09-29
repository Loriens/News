//
//  Localizable.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

protocol Localizable: RawRepresentable { }

extension Localizable {
    
    var key: String {
        return self.rawValue as? String ?? ""
    }
    
    var localized: String {
        return NSLocalizedString(self.key, comment: "")
    }
}
