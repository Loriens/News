//
//  PostListCellModel.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

final class PostListCellModel: TableCellModel {
    
    // MARK: - Props
    public override var cellIdentifier: String {
        return PostListCell.identifier
    }
    
    public override var cellHeight: CGFloat {
        return 60
    }
    
    var title: String
    
    // MARK: - Initalization
    init(title: String) {
        self.title = title
    }
    
}
