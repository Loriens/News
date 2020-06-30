//
//  PostListViewController.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

final class PostListViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Props
    var viewModel: PostListViewModel?
    var router: PostListRouterInput?
    
    private var sections: [TableSectionModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComponents()
        setupActions()
    }
    
    override func viewDidLayoutSubviews() {
        applyStyles()
    }
    
}

// MARK: - Setup functions
extension PostListViewController {
    
    func setupComponents() {
        navigationItem.title = AppLocalization.PostList.title.localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.registerCellNib(PostListCell.self)
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(loadData), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        bindViewModel()
        loadData()
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension PostListViewController {
    
    @objc
    func loadData() {
        viewModel?.loadData()
    }
    
}

// MARK: - Module functions
extension PostListViewController {
    
    func bindViewModel() {
        viewModel?.loadDataCompletion = { [weak self] result in
            switch result {
            case .success(let sections):
                self?.finishLoading(with: nil)
                self?.updateForSections(sections)
            case .failure(let error):
                self?.finishLoading(with: error)
            }
        }
    }
    
    func updateForSections(_ sections: [TableSectionModel]) {
        self.sections = sections
        self.tableView.reloadData()
    }
    
    func finishLoading(with error: Error?) {
        tableView.refreshControl?.endRefreshing()
        guard let error = error else { return }
        Toast.shared.show(title: AppLocalization.General.error.localized, message: error.localizedDescription)
    }
    
}

// MARK: - UITableViewDataSource
extension PostListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = sections[indexPath.section].rows[indexPath.row]
        
        if model is PostListCellModel {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: model.cellIdentifier) as? PostListCell else { return UITableViewCell() }
            cell.model = model
            return cell
        }
        
        return UITableViewCell()
    }
    
}

// MARK: - UITableViewDelegate
extension PostListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = sections[indexPath.section].rows[indexPath.row]
        
        return model.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = sections[indexPath.section].rows[indexPath.row]
        
        if let selectedModel = model as? PostListCellModel,
            let selectedId = selectedModel.userInfo["postId"] as? Int {
            router?.pushPostViewController(postId: selectedId)
        }
    }
    
}
