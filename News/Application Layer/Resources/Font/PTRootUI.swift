//
//  PTRootUI.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

enum PTRootUI: String {
    case light = "PTRootUI-Light"
    case regular = "PTRootUI-Regular"
    case medium = "PTRootUI-Medium"
    case bold = "PTRootUI-Bold"

    func dynamicallyScalingFont(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: rawValue, size: size) else {
            fatalError("Retrieve \(rawValue) font with error")
        }
        return UIFontMetrics.default.scaledFont(for: font)
    }
}
