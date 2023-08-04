//
//  ThemeMainColors.swift
//  
//
//  Created by Vladislav Markov on 04.08.2023.
//

import UIKit

struct ThemeMainColors: Colors {
    // MARK: - Text
    let textPrimary: UIColor? = UIColor { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .light, .unspecified:
            return UIColor(hex: "#222222") ?? .clear
        case .dark:
            return UIColor(hex: "#E4E8EE") ?? .clear
        @unknown default:
            return UIColor(hex: "#222222") ?? .clear
        }
    }
    let textSecondary = UIColor(hex: "#99A0AB")
    let textAccent = UIColor(hex: "#3A83F1")

    // MARK: - Background
    let backgroundBasic: UIColor? = UIColor { traitCollection in
        switch traitCollection.userInterfaceStyle {
        case .light, .unspecified:
            return UIColor(hex: "#FFFFFF") ?? .clear
        case .dark:
            return UIColor(hex: "#0F1116") ?? .clear
        @unknown default:
            return UIColor(hex: "#FFFFFF") ?? .clear
        }
    }
    let backgroundAccent = UIColor(hex: "#3A83F1")
}
