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
    public static var statusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Window background color
    public static var backgroundMain: UIColor {
        return UIColor(hex: "FFFFFF", alpha: 1.0)
    }
    
    // MARK: - Navigation bar background color
    public static var backgroundBar: UIColor {
        return UIColor(hex: "4ABAF9", alpha: 1.0)
    }
    
    // MARK: - Separator views background
    public static var backgroundSeparator: UIColor {
        return UIColor(hex: "A5A5AF", alpha: 1.0)
    }
    
    // MARK: - Accent color of the app
    public static var accentMain: UIColor {
        return UIColor(hex: "4ABAF9", alpha: 1.0)
    }
    
    // MARK: - Text color on accent background
    public static var accentText: UIColor {
        return UIColor(hex: "FFFFFF", alpha: 1.0)
    }
    
    // MARK: - Main text color
    public static var textMain: UIColor {
        return UIColor(hex: "36393D", alpha: 1.0)
    }
    
    // MARK: - Sub text color
    public static var textSub: UIColor {
        return UIColor(hex: "A5A5AF", alpha: 1.0)
    }
    
}
