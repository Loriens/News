//
//  PostViewModel.swift
//  News
//
//  Created by Vladislav Markov on 16.07.2023.
//  Copyright © 2023 Vladislav Markov. All rights reserved.
//

import Combine
import Foundation
import NetworkLayer

@MainActor
final class PostViewModel: ObservableObject {
    @Published var post: PostModule.Post?
    @Published var error: PostModule.Error?

    private let postId: Int
    private let networkClient: NetworkClient
    private let postSubject = PassthroughSubject<PostModule.Post, PostModule.Error>()
    private var cancellables: Set<AnyCancellable> = []

    init(postId: Int, networkClient: NetworkClient) {
        self.postId = postId
        self.networkClient = networkClient
    }

    func loadData() {
        let request = PostRequestFactory.item(postId: postId).makeRequest()

        Task {
            do {
                let response: PostResponse = try await networkClient.send(request)

                guard let body = response.body else {
                    error = .emptyPost
                    return
                }

                post = PostModule.Post(id: response.id, body: body)
            } catch {
                self.error = .unknown(error)
            }
        }
    }
}
