//
//  PostListCell.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

final class PostListCell: TableCell {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.apply(.smallTitleStyle())
        return label
    }()

    private var staticConstraints: [NSLayoutConstraint] = []

    private var titleLabelConstraints: [NSLayoutConstraint] {
        return [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20)
        ]
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }

    override func updateConstraints() {
        if staticConstraints.isEmpty {
            staticConstraints = titleLabelConstraints
            NSLayoutConstraint.activate(staticConstraints)
        }
        super.updateConstraints()
    }

    override func setupView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
        contentView.addSubview(titleLabel)
        setNeedsUpdateConstraints()
    }

    func update(with viewModel: PostListCellViewModel) {
        titleLabel.text = viewModel.title
    }
}
