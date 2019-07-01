//
//  UITableView+RegisterClasses.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    
    public func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    public func registerCellNib(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    public func registerHeaderFooterViewClass(_ viewClass: AnyClass) {
        let identifier = String.className(viewClass)
        
        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
    public func registerHeaderFooterViewNib(_ viewClass: AnyClass) {
        let identifier = String.className(viewClass)
        let nib = UINib(nibName: identifier, bundle: nil)
        
        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
    }
    
}
