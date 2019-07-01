//
//  UIViewController+Identifier.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    public class var identifier: String {
        return String.className(self)
    }
    
}
