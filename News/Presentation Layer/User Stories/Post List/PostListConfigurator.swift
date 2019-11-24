//
//  PostListConfigurator.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

enum PostListConfigurator {
    
    // Create and return controller
    static func create() -> PostListViewController {
        return PostListViewController(nibName: PostListViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return view model input
    static func configure(with reference: PostListViewController) -> PostListViewModelInput {
        let viewModel = PostListViewModel(with: reference)
        
        let router = PostListRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
