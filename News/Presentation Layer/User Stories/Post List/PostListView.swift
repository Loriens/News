//
//  PostListView.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostListViewDisplayLogic: AnyObject {
    func update(with viewModel: PostListModule.ViewModel)
    func update(with error: Error)
    func route(action: PostListModule.Route.Action)
}

final class PostListView: UIViewController {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.registerCellClass(PostListCell.self)
        return tableView
    }()

    var interactor: PostListInteractor?
    var router: PostListRouter?
    private var dataSource: UITableViewDiffableDataSource<PostListModule.Section, PostListModule.Item>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        setupActions()

        interactor?.viewDidLoad()
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
        tableView.delegate = self
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
    @objc
    private func loadData() {
        interactor?.loadData()
    }
}

// MARK: - PostListViewDisplayLogic
extension PostListView: PostListViewDisplayLogic {
    func update(with viewModel: PostListModule.ViewModel) {
        tableView.refreshControl?.endRefreshing()
        dataSource?.apply(viewModel.snapshot, animatingDifferences: true)
    }

    func update(with error: Error) {
        tableView.refreshControl?.endRefreshing()
        Toast.shared.show(title: AppLocalization.General.error.localized, message: error.localizedDescription)
    }

    func route(action: PostListModule.Route.Action) {
        router?.route(action: action)
    }
}

// MARK: - UITableViewDelegate
extension PostListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = dataSource?.itemIdentifier(for: indexPath) else { return }
        switch item {
        case let .post(post):
            interactor?.postDidSelect(post: post)
        }
    }
}
