//
//  PostListView.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit
import DesignSystem

protocol PostListViewDisplayLogic: AnyObject {
    func update(with viewModel: PostListModule.GetPostList.ViewModel)
    func update(with viewModel: PostListModule.OpenPost.ViewModel)
}

final class PostListView: UIViewController {
    enum Section {
        case main
    }

    struct Item: Hashable {
        let postId: Int
        let title: String

        func hash(into hasher: inout Hasher) {
            hasher.combine(postId)
            hasher.combine(title)
        }

        static func == (lhs: Item, rhs: Item) -> Bool {
            return lhs.postId == rhs.postId && lhs.title == rhs.title
        }
    }

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        dataSource = PostListDataSource(tableView: tableView)
        tableView.dataSource = dataSource
        tableView.delegate = self
        return tableView
    }()

    var interactor: PostListBusinessLogic?
    var router: PostListRoutingLogic?
    private var dataSource: UITableViewDiffableDataSource<Section, Item>?
    private var staticConstraints: [NSLayoutConstraint] = []

    private var tableViewConstraints: [NSLayoutConstraint] {
        let safeArea = view.safeAreaLayoutGuide
        return [
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ]
    }

    override func loadView() {
        view = View()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupComponents()
        setupActions()
        applyStyles()
        let request = PostListModule.GetPostList.Request()
        interactor?.getPostList(with: request)
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
        refreshControl.addTarget(self, action: #selector(getPostList), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    private func applyStyles() {
        (view as? View)?.applyStyle(.basic)
        tableView.backgroundColor = .clear
    }
}

// MARK: - Actions
extension PostListView {
    @objc private func getPostList() {
        let request = PostListModule.GetPostList.Request()
        interactor?.getPostList(with: request)
    }
}

// MARK: - PostListViewDisplayLogic
extension PostListView: PostListViewDisplayLogic {
    func update(with viewModel: PostListModule.GetPostList.ViewModel) {
        tableView.refreshControl?.endRefreshing()
        switch viewModel.result {
        case let .success(snapshot):
            dataSource?.apply(snapshot, animatingDifferences: true)
        case let .failure(error):
            router?.presentAlert(error: error)
        }
    }

    func update(with viewModel: PostListModule.OpenPost.ViewModel) {
        router?.routeToPost(postId: viewModel.postId)
    }
}

// MARK: - UITableViewDelegate
extension PostListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = dataSource?.itemIdentifier(for: indexPath) else { return }
        let request = PostListModule.OpenPost.Request(postId: item.postId)
        interactor?.openPost(with: request)
    }
}
