//
//  StyleWrapper+UIImageView.swift
//  News
//
//  Created by Vladislav Markov on 22.12.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import UIKit

extension StyleWrapper where Element: UIImageView {
    static func aspectFitStyle() -> StyleWrapper {
        return .wrap { imageView in
            imageView.contentMode = .scaleAspectFit
        }
    }

    static func aspectFillStyle() -> StyleWrapper {
        return .wrap { imageView in
            imageView.contentMode = .scaleAspectFill
        }
    }
}
