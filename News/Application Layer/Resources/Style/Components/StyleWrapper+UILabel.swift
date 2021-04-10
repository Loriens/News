//
//  StyleWrapper+UILabel.swift
//  News
//
//  Created by Vladislav Markov on 22.12.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UILabel {
    static func bigTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.textAlignment = .center
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = PTRootUI.bold.dynamicallyScalingFont(size: 22)
            label.textColor = AppTheme.accentMain
            label.adjustsFontForContentSizeCategory = true
        }
    }

    static func smallTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = PTRootUI.medium.dynamicallyScalingFont(size: 18)
            label.textColor = AppTheme.textMain
            label.adjustsFontForContentSizeCategory = true
        }
    }

    static func subtitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = PTRootUI.medium.dynamicallyScalingFont(size: 16)
            label.textColor = AppTheme.textSub
            label.adjustsFontForContentSizeCategory = true
        }
    }
}
