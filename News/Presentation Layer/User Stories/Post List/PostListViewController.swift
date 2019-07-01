//
//  PostListViewController.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostListViewInput: ViperViewInput {
    func updateForSections(_ sections: [TableSectionModel])
}

protocol PostListViewOutput: ViperViewOutput {
    func selectPost(id: Int)
}

class PostListViewController: ViperViewController, PostListViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Props
    fileprivate var output: PostListViewOutput? {
        guard let output = self._output as? PostListViewOutput else { return nil }
        return output
    }
    
    private var sections: [TableSectionModel] = []
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = AppLocalization.PostList.title.localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.contentInset = UIEdgeInsets(top: 8.0, left: 0.0, bottom: 8.0, right: 0.0)
        self.tableView.registerCellNib(PostListCell.self)
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.backgroundColor = AppTheme.backgroundMain
        
        self.tableView.backgroundColor = .clear
        self.tableView.separatorColor = .clear
        self.tableView.showsVerticalScrollIndicator = true
        self.tableView.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - PostListViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
    func updateForSections(_ sections: [TableSectionModel]) {
        self.sections = sections
        
        DispatchQueue.main.async { [weak self] in
            guard let controller = self else { return }
            
            controller.tableView.reloadData()
        }
    }
    
}

// MARK: - Actions
extension PostListViewController { }

// MARK: - Module functions
extension PostListViewController { }

// MARK: - UITableViewDataSource
extension PostListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
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
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        return model.cellHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = self.sections[indexPath.section].rows[indexPath.row]
        
        if let selectedModel = model as? PostListCellModel,
            let selectedId = selectedModel.userInfo["postId"] as? Int {
            self.output?.selectPost(id: selectedId)
        }
    }
    
}
