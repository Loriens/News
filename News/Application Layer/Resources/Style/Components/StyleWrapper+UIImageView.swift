//
//  StyleWrapper+UIImageView.swift
//  Test Playground
//
//  Created by  Кирилл on 3/6/19.
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
