//
//  PostViewController.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import UIKit

protocol PostViewInput: AnyObject { }

class PostViewController: UIViewController, PostViewInput {

    // MARK: - Outlets
    
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
    
}

// MARK: - Setup functions
extension PostViewController {
    
    func setupComponents() {
        navigationItem.title = ""
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupActions() { }
    
    func applyStyles() { }
    
}

// MARK: - Actions
extension PostViewController { }

// MARK: - Module functions
extension PostViewController { }
