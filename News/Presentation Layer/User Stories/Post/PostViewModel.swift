//
//  PostViewModel.swift
//  News
//
//  Created by Vladislav Markov on 16.07.2023.
//  Copyright © 2023 Vladislav Markov. All rights reserved.
//

import Foundation
import Combine
import NetworkLayer

final class PostViewModel {
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
        cancellables.removeAll()

        let request = PostRequestFactory.item(postId: postId).makeRequest()

        networkClient
            .getPublisher(request: request)
            .receive(on: DispatchQueue.main)
            .sink { [unowned self] completion in
                switch completion {
                case .finished:
                    break
                case let .failure(error):
                    self.error = .unknown(error)
                }
            } receiveValue: { [unowned self] (value: PostResponse) in
                guard let body = value.body else {
                    error = .emptyPost
                    return
                }
                post = PostModule.Post(id: value.id, body: body)
            }
            .store(in: &cancellables)

    }
}
