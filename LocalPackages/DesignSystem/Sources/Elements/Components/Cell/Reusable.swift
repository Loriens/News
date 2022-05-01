//
//  Reusable.swift
//  
//
//  Created by Марков Владислав Викторович on 01.05.2022.
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
