//
//  AppTheme.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum AppTheme {
    static var statusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    static var backgroundBar: UIColor {
        return UIColor(red: 74 / 255, green: 186 / 255, blue: 249 / 255, alpha: 1)
    }

    static var accentMain: UIColor {
        return UIColor(red: 74 / 255, green: 186 / 255, blue: 249 / 255, alpha: 1)
    }

    static var accentText: UIColor {
        return UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1)
    }

    static var textMain: UIColor {
        return UIColor(red: 54 / 255, green: 57 / 255, blue: 61 / 255, alpha: 1)
    }

    static var textSub: UIColor {
        return UIColor(red: 165 / 255, green: 165 / 255, blue: 175 / 255, alpha: 1)
    }
}
