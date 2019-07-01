//
//  OriginCollectionViewCell.swift
//
//  Created by  Кирилл on 22.01.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit
import GKExtensions

open class OriginCollectionViewCell: UICollectionViewCell {
    
    class public var identifier: String {
        return String.className(self)        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    open func setup() { }
    
    open class func cellFrame() -> CGSize {
        return CGSize(width: 50.0, height: 50.0)
    }
    
    open func setData(_ data: Any?) { }
    
}
