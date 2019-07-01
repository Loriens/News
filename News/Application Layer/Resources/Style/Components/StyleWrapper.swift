//
//  StyleWrapper.swift
//  Test Playground
//
//  Created by  Кирилл on 1/22/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

typealias Style<Element> = (Element) -> Void

enum StyleWrapper<Element> {
    case wrap(style: Style<Element>)    
}
