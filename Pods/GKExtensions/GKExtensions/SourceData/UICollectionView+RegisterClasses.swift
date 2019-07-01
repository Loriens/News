//
//  UICollectionView+RegisterClasses.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    public func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        
        self.register(cellClass, forCellWithReuseIdentifier: identifier)
    }
    
    public func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
}
