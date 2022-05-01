//
//  TableCell.swift
//  
//
//  Created by Марков Владислав Викторович on 01.05.2022.
//

import UIKit

open class TableCell: UITableViewCell, Reusable {
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    open func setupView() { }
}
