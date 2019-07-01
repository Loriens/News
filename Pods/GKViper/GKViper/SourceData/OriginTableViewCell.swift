//
//  OriginTableViewCell.swift
//
//  Created by  Кирилл on 15.01.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit
import GKExtensions

open class OriginTableViewCell: UITableViewCell {
    
    class public var identifier: String {
        return String.className(self)        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    open func setup() { }
    
    open class func height() -> CGFloat {
        return 48.0
    }
    
    open func setData(_ data: Any?) {
        if let menuText = data as? String {
            self.textLabel?.text = menuText
        }
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if highlighted {
            self.alpha = 0.4
        } else {
            self.alpha = 1.0
        }
    }
    
    override open func setSelected(_ selected: Bool, animated: Bool) { }
    
}
