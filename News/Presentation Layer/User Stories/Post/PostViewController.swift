//
//  PostViewController.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

final class PostViewController: UIViewController {
    
    // MARK: - Subviews
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = AppLocalization.General.loading.localized
        return label
    }()
    
    // MARK: - Props
    var viewModel: PostViewModel?
    var router: PostRouterInput?
    
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
extension PostViewController {
    
    func setupComponents() {
        navigationItem.title = AppLocalization.Post.title.localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        view.addSubview(textLabel)
        view.backgroundColor = .white
        view.setNeedsUpdateConstraints()
        setupConstraints()
        
        bindViewModel()
        viewModel?.loadData()
    }
    
    func setupActions() { }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            textLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32)
        ])
    }
    
    func applyStyles() {
        textLabel.apply(.bigTitleStyle())
    }
    
}

// MARK: - Actions
extension PostViewController { }

// MARK: - Module functions
extension PostViewController {
    
    func bindViewModel() {
        viewModel?.loadDataCompletion = { [unowned self] result in
            switch result {
            case .success(let post):
                self.finishLoading(with: nil)
                self.updatePost(post)
            case .failure(let error):
                self.finishLoading(with: error)
            }
        }
    }
    
    func updatePost(_ post: Post) {
        UIView.animate(withDuration: 0.3) {
            self.textLabel.text = post.text
        }
    }
    
    func finishLoading(with error: Error?) {
        guard error != nil else { return }
        UIView.animate(withDuration: 0.3) {
            self.textLabel.text = AppLocalization.Post.empty.localized
        }
    }
    
}
