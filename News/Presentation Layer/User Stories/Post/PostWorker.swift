//
//  PostWorker.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import NetworkLayer

final class PostWorker {
    private let postId: PostModule.Post.Id
    private let networkClient: NetworkClient

    init(postId: PostModule.Post.Id, networkClient: NetworkClient) {
        self.postId = postId
        self.networkClient = networkClient
    }

    func getPost(completion: @escaping (Result<PostModule.Post, NetworkError>) -> Void) {
        let request = PostRequestFactory.item(postId: postId).makeRequest()
        networkClient.perform(request: request) { (result: Result<PostModule.Post, NetworkError>)  in
            completion(result)
        }
    }
}
