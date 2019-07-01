//
//  UIStackView+RemoveAll.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public extension UIStackView {
    
    public func removeAllArrangedSubviews() {
        for subview in self.arrangedSubviews {
            subview.removeFromSuperview()
        }
    }
    
}
