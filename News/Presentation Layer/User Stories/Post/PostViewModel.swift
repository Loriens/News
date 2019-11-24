//
//  PostViewModel.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

protocol PostViewModelInput {
    func configure(with data: Any?)
}

class PostViewModel {
    
    // MARK: - Props
    private var postId: Int?
    private weak var view: PostViewInput?
    
    // MARK: - Initialization
    init(with view: PostViewInput?) {
        self.view = view
    }
    
    // MARK: - Public functions
    
}

// MARK: - Module functions
extension PostViewModel { }

// MARK: - PostViewModelInput
extension PostViewModel: PostViewModelInput {
    
    func configure(with data: Any?) {
        if let postId = data as? Int {
            self.postId = postId
        }
    }
    
}
