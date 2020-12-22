//
//  StyleWrapper.swift
//  News
//
//  Created by Vladislav Markov on 22.12.2020.
//  Copyright © 2020 Vladislav Markov. All rights reserved.
//

import Foundation

typealias Style<Element> = (Element) -> Void

enum StyleWrapper<Element> {
    case wrap(style: Style<Element>)
}
