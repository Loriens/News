//
//  PostWorker.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

final class PostWorker {
    private var postId: Int
    private var networkClient = NetworkClient.shared

    init(postId: Int) {
        self.postId = postId
    }

    func getPost(completion: @escaping (Result<PostModels.Post, PostModels.Error>) -> Void) {
        networkClient.request(with: PostApiRouter.item(postId: postId))
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
