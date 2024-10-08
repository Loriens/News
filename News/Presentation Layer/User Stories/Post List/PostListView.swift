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
    private var cancellables: Set<AnyCancellable> = []

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
        setupConstraints()
        setupActions()
        applyStyles()

        bindViewModel()
        loadData()
    }

    private func setupComponents() {
        navigationItem.title = AppLocalization.PostList.title.localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        view.addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate(tableViewConstraints)
    }

    private func setupActions() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.refreshControl = refreshControl

        let traits: [UITrait] = [UITraitVerticalSizeClass.self, UITraitHorizontalSizeClass.self]
        registerForTraitChanges(traits, action: #selector(reloadData))
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

    @objc private func loadData() {
        viewModel.loadData()
    }

    @objc private func reloadData() {
        viewModel.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension PostListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = dataSource?.itemIdentifier(for: indexPath) else { return }
        viewModel.openPost(postId: item.postId)
    }
}
