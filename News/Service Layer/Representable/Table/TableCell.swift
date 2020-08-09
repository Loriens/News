//
//  TableCell.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

public protocol TableCellRepresentable {
    var model: TableCellIdentifiable? { get set }
}

open class TableCell: UITableViewCell, TableCellRepresentable {
    
    // MARK: - Identifier
    class public var identifier: String {
        return String.className(self)
    }
    
    // MARK: - Props
    public var model: TableCellIdentifiable? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Initialization
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    // MARK: - Setup functions
    open func setupView() { }
    
    open func updateViews() { }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) { }
    
    override open func setSelected(_ selected: Bool, animated: Bool) { }
    
}
