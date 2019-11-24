//
//  PostListViewController.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostListViewInput: AnyObject {
    func updateForSections(_ sections: [TableSectionModel])
}

class PostListViewController: UIViewController, PostListViewInput {

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
    
    // MARK: - PostListViewInput
    func updateForSections(_ sections: [TableSectionModel]) {
        self.sections = sections
        
        DispatchQueue.main.async { [weak self] in
            guard let controller = self else { return }
            
            controller.tableView.reloadData()
        }
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
        
        viewModel?.loadData()
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension PostListViewController { }

// MARK: - Module functions
extension PostListViewController { }

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
//            output?.selectPost(id: selectedId)
        }
    }
    
}
