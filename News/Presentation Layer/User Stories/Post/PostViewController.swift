//
//  PostViewController.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostViewInput: AnyObject {
    func updatePost(_ post: Post)
    func finishLoading(with error: Error?)
}

class PostViewController: UIViewController, PostViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var textLabel: UILabel!
    
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
    
    // MARK: - PostViewInput
    func updatePost(_ post: Post) {
        DispatchQueue.main.async { [weak self] in
            guard let controller = self else { return }
            
            UIView.animate(withDuration: 0.3) {
                controller.textLabel.text = post.text
            }
        }
    }
    
    func finishLoading(with error: Error?) {
        guard let error = error else { return }
        error.show()
        DispatchQueue.main.async { [weak self] in
            guard let controller = self else { return }
            
            UIView.animate(withDuration: 0.3) {
                controller.textLabel.text = AppLocalization.Post.empty.localized
            }
        }
    }
    
}

// MARK: - Setup functions
extension PostViewController {
    
    func setupComponents() {
        navigationItem.title = AppLocalization.Post.title.localized
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        textLabel.text = AppLocalization.General.loading.localized
        
        viewModel?.loadData()
    }
    
    func setupActions() { }
    
    func applyStyles() {
        textLabel.apply(.bigTitleStyle())
    }
    
}

// MARK: - Actions
extension PostViewController { }

// MARK: - Module functions
extension PostViewController { }
