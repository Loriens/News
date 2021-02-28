//
//  TableCell.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

open class TableCell: UITableViewCell, Reusable {
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    open func setupView() { }
}
