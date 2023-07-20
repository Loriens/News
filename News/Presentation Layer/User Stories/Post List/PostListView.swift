//
//  PostListView.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Combine
import DesignSystem
import UIKit

final class PostListView: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        dataSource = PostListDataSource(tableView: tableView)
        tableView.dataSource = dataSource
        tableView.delegate = self
        return tableView
    }()

    var router: PostListRouting?
    private let viewModel: PostListViewModel
    private var dataSource: UITableViewDiffableDataSource<PostListModule.Section, PostListModule.Item>?
    private var staticConstraints: [NSLayoutConstraint] = []
    private var cancellables: [AnyCancellable] = []

    private var tableViewConstraints: [NSLayoutConstraint] {
        let safeArea = view.safeAreaLayoutGuide
        return [
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ]
    }

    init(viewModel: PostListViewModel) {
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

        loadData()
    }

    override func updateViewConstraints() {
        if staticConstraints.isEmpty {
            staticConstraints = tableViewConstraints
            NSLayoutConstraint.activate(staticConstraints)
        }
        super.updateViewConstraints()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard traitCollection.preferredContentSizeCategory
                != previousTraitCollection?.preferredContentSizeCategory else { return }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    private func setupComponents() {
        navigationItem.title = AppLocalization.PostList.title.localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.addSubview(tableView)
        view.setNeedsUpdateConstraints()
    }

    private func setupActions() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    private func applyStyles() {
        (view as? View)?.applyStyle(.basic)
        tableView.backgroundColor = .clear
    }

    private func bindViewModel() {
        [
            viewModel.$snapshot.sink { [unowned self] snapshot in
                guard let snapshot else { return }
                tableView.refreshControl?.endRefreshing()
                dataSource?.apply(snapshot, animatingDifferences: true)
            },
            viewModel.$error.sink { [unowned self] error in
                guard let error else { return }
                tableView.refreshControl?.endRefreshing()
                router?.presentAlert(error: error)
            },
            viewModel.openPostPublisher.sink { [unowned self] postId in
                router?.routeToPost(postId: postId)
            }
        ].forEach { $0.store(in: &cancellables) }
    }

    @objc
    private func loadData() {
        viewModel.loadData()
    }
}

// MARK: - UITableViewDelegate
extension PostListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = dataSource?.itemIdentifier(for: indexPath) else { return }
        viewModel.openPost(postId: item.postId)
    }
}
