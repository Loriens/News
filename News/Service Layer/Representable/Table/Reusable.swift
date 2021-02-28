//
//  Reusable.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import UIKit

public protocol Reusable: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
