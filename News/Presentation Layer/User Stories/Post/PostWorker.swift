//
//  PostWorker.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

final class PostWorker {
    private let postId: PostModule.Post.Id
    private let networkService: NetworkService

    init(postId: PostModule.Post.Id, networkService: NetworkService) {
        self.postId = postId
        self.networkService = networkService
    }

    func getPost(completion: @escaping (Result<PostModule.Post, PostModule.Error>) -> Void) {
        networkService.request(with: PostApiRouter.item(postId: postId))
            .responseDecodable(of: PostModule.Post.self) { response in
                if let error = response.error {
                    completion(.failure(.unknown(error)))
                    return
                }
                guard let post = response.value,
                      post.body != nil else {
                    completion(.failure(.emptyPost))
                    return
                }
                completion(.success(post))
            }
    }
}
