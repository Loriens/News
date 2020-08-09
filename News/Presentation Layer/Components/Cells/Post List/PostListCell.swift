//
//  PostListCell.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

final class PostListCell: TableCell {
    
    // MARK: - Subviews
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Props
    private var shouldSetupConstraints = true
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        applyStyles()
    }
    
    override func updateConstraints() {
        if shouldSetupConstraints {
            setupConstraints()
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    // MARK: - Setup functions
    override func setupView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(titleLabel)
        
        setNeedsUpdateConstraints()
        setupActions()
    }
    
    override func updateViews() {
        guard let model = model as? PostListCellModel else { return }
        
        titleLabel.text = model.title
        
        setNeedsLayout()
    }
    
    private func setupActions() { }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    private func applyStyles() {
        titleLabel.apply(.smallTitleStyle())
    }
    
}
