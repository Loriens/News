//
//  PostWorker.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

final class PostWorker {
    private let postId: Int
    private let networkService: NetworkService

    init(postId: Int, networkService: NetworkService) {
        self.postId = postId
        self.networkService = networkService
    }

    func getPost(completion: @escaping (Result<PostModels.Post, PostModels.Error>) -> Void) {
        networkService.request(with: PostApiRouter.item(postId: postId))
            .responseDecodable(of: PostModels.Post.self) { response in
                if let error = response.error {
                    completion(.failure(.unknown(error)))
                    return
                }
                guard let post = response.value else {
                    completion(.failure(.emptyPost))
                    return
                }
                completion(.success(post))
            }
    }
}
