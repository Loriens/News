//
//  PostListWorker.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

final class PostListWorker {
    private var networkClient = NetworkClient.shared

    init() { }

    func getPostList(completion: @escaping (Result<[PostListModule.Post], PostListModule.Error>) -> Void) {
        networkClient.request(with: PostApiRouter.list)
            .responseDecodable(of: [PostListModule.Post].self) { response in
                if let error = response.error {
                    completion(.failure(.unknown(error)))
                    return
                }
                guard let posts = response.value else {
                    completion(.success([]))
                    return
                }
                completion(.success(posts))
            }
    }
}
