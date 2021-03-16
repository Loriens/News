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

    func getPostList(completion: @escaping (Result<[PostListModels.Post], PostListModels.Error>) -> Void) {
        networkClient.request(with: PostApiRouter.list)
            .responseDecodable(of: [PostListModels.Post].self) { response in
                if let error = response.error {
                    completion(.failure(.unknown(error)))
                    return
                }
                completion(.success(response.value ?? []))
            }
    }
}
