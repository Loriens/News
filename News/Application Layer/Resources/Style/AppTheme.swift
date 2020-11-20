//
//  AppTheme.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum AppTheme {
    
    // MARK: - Status bar style
    static var statusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Window background color
    static var backgroundMain: UIColor {
        return UIColor(hex: "FFFFFF", alpha: 1.0)
    }
    
    // MARK: - Navigation bar background color
    static var backgroundBar: UIColor {
        return UIColor(hex: "4ABAF9", alpha: 1.0)
    }
    
    // MARK: - Separator views background
    static var backgroundSeparator: UIColor {
        return UIColor(hex: "A5A5AF", alpha: 1.0)
    }
    
    // MARK: - Accent color of the app
    static var accentMain: UIColor {
        return UIColor(hex: "4ABAF9", alpha: 1.0)
    }
    
    // MARK: - Text color on accent background
    static var accentText: UIColor {
        return UIColor(hex: "FFFFFF", alpha: 1.0)
    }
    
    // MARK: - Main text color
    static var textMain: UIColor {
        return UIColor(hex: "36393D", alpha: 1.0)
    }
    
    // MARK: - Sub text color
    static var textSub: UIColor {
        return UIColor(hex: "A5A5AF", alpha: 1.0)
    }
    
}
