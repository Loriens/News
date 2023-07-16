//
//  PostView.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Combine
import DesignSystem
import UIKit

final class PostView: UIViewController {
    private let textLabel: Label = {
        let label = Label()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = AppLocalization.General.loading.localized
        label.isAccessibilityElement = true
        return label
    }()

    var router: PostRouting?
    private let viewModel: PostViewModel
    private var staticConstraints: [NSLayoutConstraint] = []
    private var cancellables: [AnyCancellable] = []

    private var textLabelConstraints: [NSLayoutConstraint] {
        let margins = view.layoutMarginsGuide
        return [
            textLabel.topAnchor.constraint(equalTo: margins.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        ]
    }

    init(viewModel: PostViewModel) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = View()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        setupActions()
        applyStyles()
        bindViewModel()

        viewModel.loadData()
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
        view.setNeedsUpdateConstraints()
    }

    private func setupActions() { }

    private func applyStyles() {
        (view as? View)?.applyStyle(.basic)
        textLabel.applyStyle(.bigTitle)
    }

    private func bindViewModel() {
        [
            viewModel.$post.sink { [unowned self] post in
                guard let post else { return }
                UIView.animate(withDuration: 0.3) { [self] in
                    textLabel.text = post.body
                }
            },
            viewModel.$error.sink { [unowned self] error in
                guard let error else { return }
                UIView.animate(withDuration: 0.3) { [self] in
                    textLabel.text = error.localizedDescription
                }
            }
        ].forEach { $0.store(in: &cancellables) }
    }
}
