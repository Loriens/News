//
//  Error+show.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

extension Error {
    
    func show() {
        Toast.shared.hideAllToasts()
        Toast.shared.show(title: AppLocalization.General.error.localized, message: localizedDescription)
    }
    
    func show(duration: Double) {
        Toast.shared.hideAllToasts()
        Toast.shared.show(title: AppLocalization.General.error.localized, message: localizedDescription, duration: duration)
    }
    
}
