//
//  PostView.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostViewDisplayLogic: AnyObject {
    func update(with viewModel: PostModels.GetPost.ViewModel)
}

final class PostView: UIViewController {
    private let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = AppLocalization.General.loading.localized
        return label
    }()

    var interactor: PostBusinessLogic?
    var router: PostRoutingLogic?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupComponents()
        setupActions()

        interactor?.getPost()
    }

    override func viewDidLayoutSubviews() {
        applyStyles()
    }

    private func setupComponents() {
        navigationItem.title = AppLocalization.Post.title.localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.addSubview(textLabel)
        view.backgroundColor = .white
        setupConstraints()
    }

    private func setupActions() { }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32)
        ])
    }

    private func applyStyles() {
        textLabel.apply(.bigTitleStyle())
    }
}

// MARK: - PostViewDisplayLogic
extension PostView: PostViewDisplayLogic {
    func update(with viewModel: PostModels.GetPost.ViewModel) {
        switch  viewModel.result {
        case let .success(post):
            UIView.animate(withDuration: 0.3) {
                self.textLabel.text = post.body ?? ""
            }
        case let .failure(error):
            UIView.animate(withDuration: 0.3) {
                self.textLabel.text = error.localizedDescription
            }
        }
    }
}
