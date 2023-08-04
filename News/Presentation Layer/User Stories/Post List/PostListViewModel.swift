//
//  PostListViewModel.swift
//  News
//
//  Created by Vladislav Markov on 16.07.2023.
//  Copyright © 2023 Vladislav Markov. All rights reserved.
//

import Foundation
import Combine
import UIKit
import NetworkLayer

final class PostListViewModel {
    typealias Snapshot = NSDiffableDataSourceSnapshot<PostListModule.Section, PostListModule.Item>

    @Published var snapshot: Snapshot?
    @Published var error: PostListModule.Error?
    var openPostPublisher: AnyPublisher<PostListModule.Item.Id, Never> {
        openPostSubject.eraseToAnyPublisher()
    }

    private let networkClient: NetworkClient
    private let openPostSubject = PassthroughSubject<PostListModule.Item.Id, Never>()
    private var cancellables: Set<AnyCancellable> = []

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func loadData() {
        cancellables.removeAll()

        let request = PostRequestFactory.list.makeRequest()

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
            } receiveValue: { [unowned self] (value: [PostResponse]) in
                self.snapshot = self.makeSnapshot(postResponses: value)
            }
            .store(in: &cancellables)
    }

    func openPost(postId: PostListModule.Item.Id) {
        openPostSubject.send(postId)
    }

    private func makeSnapshot(postResponses: [PostResponse]) -> Snapshot {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        let items = postResponses.map { PostListModule.Item(postId: $0.id, title: $0.title) }
        snapshot.appendItems(items)
        return snapshot
    }
}
