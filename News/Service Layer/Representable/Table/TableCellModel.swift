//
//  TableCellModel.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

public protocol TableCellIdentifiable {
    var cellIdentifier: String { get }
    var cellHeight: CGFloat { get }
    
    var userInfo: [String: Any] { get set }
}

open class TableCellModel: TableCellIdentifiable {
    
    // MARK: - Props
    public var cellIdentifier: String {
        return ""
    }
    
    public var cellHeight: CGFloat {
        return UITableView.automaticDimension
    }
    
    public var userInfo: [String: Any] = [:]
    
    // MARK: - Initialization
    init() { }
    
}
