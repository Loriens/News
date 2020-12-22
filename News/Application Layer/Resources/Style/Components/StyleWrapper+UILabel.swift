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
            label.font = PTRootUI.bold.font(size: 20.0)
            label.textColor = AppTheme.accentMain
        }
    }

    static func smallTitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = PTRootUI.medium.font(size: 16.0)
            label.textColor = AppTheme.textMain
        }
    }

    static func subtitleStyle() -> StyleWrapper {
        return .wrap { label in
            label.textAlignment = .left
            label.numberOfLines = 0
            label.lineBreakMode = .byTruncatingTail
            label.font = PTRootUI.medium.font(size: 14.0)
            label.textColor = AppTheme.textSub
        }
    }
}
