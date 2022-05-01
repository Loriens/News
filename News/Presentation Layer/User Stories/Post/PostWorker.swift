//
//  PostWorker.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import NetworkLayer

final class PostWorker {
    private let postId: Int
    private let networkClient: NetworkClient

    init(postId: Int, networkClient: NetworkClient) {
        self.postId = postId
        self.networkClient = networkClient
    }

    func getPost(completion: @escaping (Result<PostResponse, NetworkError>) -> Void) {
        let request = PostRequestFactory.item(postId: postId).makeRequest()
        networkClient.perform(request: request) { (result: Result<PostResponse, NetworkError>)  in
            completion(result)
        }
    }
}
