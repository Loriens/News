//
//  String+Validation.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation
import UIKit

public extension String {
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "^[-a-z0-9!#$%&'*+\\/=?^_`{|}~]+(\\.[-a-z0-9!#$%&'*+\\/=?^_`{|}~]+)*@([a-z0-9]([-a-z0-9]{0,61}[a-z0-9])?\\.)*(aero|arpa|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|ru|tel|travel|[a-z][a-z])$"
        
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}
