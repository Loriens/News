//
//  UIView+LoadNib.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    
    public class func loadNib(withOwner owner: Any? = nil) -> Self {
        let name = String(describing: type(of: self)).components(separatedBy: ".")[0]
        let view = UINib(nibName: name, bundle: nil).instantiate(withOwner: owner, options: nil)[0]
        
        // swiftlint:disable:next force_unwrapping
        return cast(view)!
    }
    
    public func loadFromNibIfEmbeddedInDifferentNib() -> Self {
        let isPlaceholder = subviews.isEmpty
        if isPlaceholder {
            let realView = type(of: self).loadNib()
            realView.frame = frame
            translatesAutoresizingMaskIntoConstraints = false
            realView.translatesAutoresizingMaskIntoConstraints = false
            return realView
        }
        
        return self
    }
    
}

private func cast<T, U>(_ value: T) -> U? {
    return value as? U
}
