//
//  PostListCell.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

class PostListCell: TableCell {

    // MARK: - Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: - Setup functions
    override func setupView() {
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        self.titleLabel.apply(.smallTitleStyle())
    }
    
    override func updateViews() {
        guard let model = self.model as? PostListCellModel else { return }
        
        self.titleLabel.text = model.title
    }
    
}
