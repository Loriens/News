//
//  ThemeMainColors.swift
//
//
//  Created by Vladislav Markov on 04.08.2023.
//

import UIKit

struct ThemeMainFont: Font {
    func dynamicallyScalingFont(weight: UIFont.Weight, size: CGFloat) -> UIFont? {
        let name: String
        switch weight {
        case .light:
            name = "PTRootUI-Light"
        case .regular:
            name = "PTRootUI-Regular"
        case .medium:
            name = "PTRootUI-Medium"
        case .bold:
            name = "PTRootUI-Bold"
        default:
            return nil
        }
        guard let font = UIFont(name: name, size: size) else {
            fatalError("Retrieve \(name) font with error")
        }
        return UIFontMetrics.default.scaledFont(for: font)
    }
}
