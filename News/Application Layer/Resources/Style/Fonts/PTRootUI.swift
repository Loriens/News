//
//  PTRootUI.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum PTRootUI {
    case light
    case regular
    case medium
    case bold
    
    public func font(size: CGFloat) -> UIFont {
        switch self {
        case .light:
            if let font = UIFont(name: "PT Root UI_Light", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .light)
        case .regular:
            if let font = UIFont(name: "PT Root UI_Regular", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .regular)
        case .medium:
            if let font = UIFont(name: "PT Root UI_Medium", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .medium)
        case .bold:
            if let font = UIFont(name: "PT Root UI_Bold", size: size) {
                return font
            }
            return UIFont.systemFont(ofSize: size, weight: .bold)
        }
    }
}
