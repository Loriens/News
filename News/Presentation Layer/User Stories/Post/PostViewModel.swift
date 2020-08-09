//
//  PostViewModel.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

protocol PostViewModelInput {
    func configure(postId: Int)
}

final class PostViewModel {
    
    // MARK: - Props
    var loadDataCompletion: ((Swift.Result<Post, PostError>) -> Void)?
    
    private var postId: Int?
    
    // MARK: - Initialization
    init() { }
    
    // MARK: - Public functions
    public func loadData() {
        guard let postId = postId else {
            loadDataCompletion?(.failure(.postWasNotFound))
            return
        }
        NetworkClient.request(with: PostApiRouter.item(postId: postId))
            .responseDecodable(of: PostResponse.self) { [weak self] response in
                if let error = response.error {
                    self?.loadDataCompletion?(.failure(.unknown(error)))
                    return
                }
                guard let post = response.value?.defaultMapping() else {
                    self?.loadDataCompletion?(.failure(.emptyPost))
                    return
                }
                self?.loadDataCompletion?(.success(post))
            }
    }
    
}

// MARK: - Module functions
extension PostViewModel { }

// MARK: - PostViewModelInput
extension PostViewModel: PostViewModelInput {
    
    func configure(postId: Int) {
        self.postId = postId
    }
    
}
