//
//  PostViewModel.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Alamofire

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
    public func loadData() {
        guard let postId = postId else { return }
        PostAPIClient.item(postId: postId, completion: postResult)
    }
    
}

// MARK: - Module functions
extension PostViewModel {
    
    private func postResult(result: Result<PostResponse?>) {
        switch result {
        case let .success(postResponse):
            guard let post = postResponse?.defaultMapping() else {
                view?.finishLoading(with: UnknownError())
                return
            }
            view?.finishLoading(with: nil)
            view?.updatePost(post)
        case let .failure(error):
            view?.finishLoading(with: error)
        }
    }
    
}

// MARK: - PostViewModelInput
extension PostViewModel: PostViewModelInput {
    
    func configure(with data: Any?) {
        if let postId = data as? Int {
            self.postId = postId
        }
    }
    
}
