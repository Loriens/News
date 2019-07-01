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
        self.navigationItem.title = "".localized
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
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
