//
//  PostListView.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostListViewDisplayLogic: AnyObject {
    func update(with viewModel: PostListModels.GetPostList.ViewModel)
    func update(with viewModel: PostListModels.OpenPost.ViewModel)
}

final class PostListView: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()

    var interactor: PostListBusinessLogic?
    var router: PostListRoutingLogic?
    private var dataSource: UITableViewDiffableDataSource<PostListModels.Section, PostListModels.Item>?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupComponents()
        setupActions()

        interactor?.getPostList()
    }

    override func viewDidLayoutSubviews() {
        applyStyles()
    }

    private func setupComponents() {
        navigationItem.title = AppLocalization.PostList.title.localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        dataSource = PostListDataSource(tableView: tableView)
        tableView.dataSource = dataSource
        view.addSubview(tableView)
        setupConstraints()
    }

    private func setupActions() { }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    private func applyStyles() { }
}

// MARK: - Actions
extension PostListView {
    @objc private func loadData() {
        interactor?.getPostList()
    }
}

// MARK: - PostListViewDisplayLogic
extension PostListView: PostListViewDisplayLogic {
    func update(with viewModel: PostListModels.GetPostList.ViewModel) {
        tableView.refreshControl?.endRefreshing()
        switch viewModel.result {
        case let .success(snapshot):
            dataSource?.apply(snapshot, animatingDifferences: true)
        case let .failure(error):
            Toast.shared.show(title: AppLocalization.General.error.localized, message: error.localizedDescription)
        }
    }

    func update(with viewModel: PostListModels.OpenPost.ViewModel) {
        router?.routeToPost(postId: viewModel.postId)
    }
}

// MARK: - UITableViewDelegate
extension PostListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = dataSource?.itemIdentifier(for: indexPath) else { return }
        switch item {
        case let .post(post):
            let request = PostListModels.OpenPost.Request(post: post)
            interactor?.openPost(with: request)
        }
    }
}
