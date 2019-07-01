//
//  Stylable.swift
//  Test Playground
//
//  Created by  Кирилл on 1/22/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

protocol Stylable { }

extension NSObject: Stylable { }

extension Stylable {
    
    static func style(style: @escaping Style<Self>) -> Style<Self> { return style }
    
    func apply(_ style: StyleWrapper<Self>) {
        switch style {
        case let .wrap(style):
            style(self)
        }
    }
}
