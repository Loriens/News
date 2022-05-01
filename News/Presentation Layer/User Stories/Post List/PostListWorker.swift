//
//  PostListWorker.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import NetworkLayer

final class PostListWorker {
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func getPostList(completion: @escaping (Result<[PostResponse], NetworkError>) -> Void) {
        let request = PostRequestFactory.list.makeRequest()
        networkClient.perform(request: request) { (result: Result<[PostResponse], NetworkError>)  in
            completion(result)
        }
    }
}
