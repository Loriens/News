//
//  UIViewController+identifier.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    public class var identifier: String {
        return String.className(self)
    }
    
}
