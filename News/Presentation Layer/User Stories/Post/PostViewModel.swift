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
    var loadDataCompletion: ((Swift.Result<Post, PostError>) -> Void)?
    
    private var postId: Int?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - Public functions
    public func loadData() {
        guard let postId = postId else { return }
        PostApiClient.item(postId: postId, completion: postResult)
    }
    
}

// MARK: - Module functions
extension PostViewModel {
    
    private func postResult(result: Swift.Result<PostResponse?, Error>) {
        switch result {
        case let .success(postResponse):
            guard let post = postResponse?.defaultMapping() else {
                loadDataCompletion?(.failure(.emptyPost))
                return
            }
            loadDataCompletion?(.success(post))
        case let .failure(error):
            loadDataCompletion?(.failure(.unknown(error)))
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
