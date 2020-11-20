//
//  PostConfigurator.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

enum PostConfigurator {

    static func create() -> PostViewController {
        return PostViewController()
    }
    
    static func configure(with reference: PostViewController) -> PostViewModelInput {
        let viewModel = PostViewModel()
        
        let router = PostRouter()
        router.viewController = reference
        
        reference.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
