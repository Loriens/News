//
//  PostListCellModel.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

class PostListCellModel: TableCellModel {
    
    public override var cellIdentifier: String {
        return PostListCell.identifier
    }
    
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
}
