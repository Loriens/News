//
//  TableSectionModel.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

public protocol TableSectionRepresentable {
    var rows: [TableCellIdentifiable] { get set }
}

open class TableSectionModel: TableSectionRepresentable {
    
    // MARK: - Props
    public var rows: [TableCellIdentifiable]
    
    // MARK: - Initialization
    public init() {
        self.rows = []
    }
    
}
