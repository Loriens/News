//
//  PostConfigurator.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

enum PostConfigurator {
    
    // Create and return controller
    static func create() -> PostViewController {
        return PostViewController(nibName: PostViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return view model input
    static func configure(with reference: PostViewController) -> PostViewModelInput {
        let viewModel = PostViewModel(with: reference)
        
        let router = PostRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
