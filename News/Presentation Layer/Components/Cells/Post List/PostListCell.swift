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
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        applyStyles()
    }
    
    // MARK: - Setup functions
    override func setupView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        setupActions()
    }
    
    override func updateViews() {
        guard let model = model as? PostListCellModel else { return }
        
        titleLabel.text = model.title
    }
    
    private func setupActions() { }
    
    private func applyStyles() {
        titleLabel.apply(.smallTitleStyle())
    }
    
}
