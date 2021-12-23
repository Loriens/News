//
//  PostView.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostViewDisplayLogic: AnyObject {
    func update(with viewModel: PostModule.GetPost.ViewModel)
}

final class PostView: UIViewController {
    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = AppLocalization.General.loading.localized
        label.isAccessibilityElement = true
        return label
    }()

    var interactor: PostBusinessLogic?
    var router: PostRoutingLogic?
    private var staticConstraints: [NSLayoutConstraint] = []

    private var textLabelConstraints: [NSLayoutConstraint] {
        let margins = view.layoutMarginsGuide
        return [
            textLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        setupActions()
        interactor?.getPost()
    }

    override func viewDidLayoutSubviews() {
        applyStyles()
    }

    override func updateViewConstraints() {
        if staticConstraints.isEmpty {
            staticConstraints = textLabelConstraints
            NSLayoutConstraint.activate(staticConstraints)
        }
        super.updateViewConstraints()
    }

    private func setupComponents() {
        navigationItem.title = AppLocalization.Post.title.localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.addSubview(textLabel)
        view.backgroundColor = .white
        view.setNeedsUpdateConstraints()
    }

    private func setupActions() { }

    private func applyStyles() {
        textLabel.apply(.bigTitleStyle())
    }
}

// MARK: - PostViewDisplayLogic
extension PostView: PostViewDisplayLogic {
    func update(with viewModel: PostModule.GetPost.ViewModel) {
        switch  viewModel.result {
        case let .success(post):
            UIView.animate(withDuration: 0.3) { [self] in
                textLabel.text = post.body ?? ""
            }
        case let .failure(error):
            UIView.animate(withDuration: 0.3) { [self] in
                textLabel.text = error.localizedDescription
            }
        }
    }
}
