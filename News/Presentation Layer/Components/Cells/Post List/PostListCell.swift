//
//  PostListCell.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

final class PostListCell: TableCell {
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.apply(.smallTitleStyle())
        return label
    }()

    override func prepareForReuse() {
        titleLabel.text = ""
        super.prepareForReuse()
    }

    override func setupView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(titleLabel)

        setupActions()
        setupConstraints()
    }
    
    func update(with title: String) {
        titleLabel.text = title
    }
    
    private func setupActions() { }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20)
        ])
    }
}
