//
//  PostListConfigurator.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

enum PostListConfigurator {
    
    static func create() -> PostListViewController {
        return PostListViewController()
    }

    static func configure(with reference: PostListViewController) -> PostListViewModelInput {
        let viewModel = PostListViewModel()
        
        let router = PostListRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
