//
//  PostListViewModel.swift
//  News
//
//  Created by Vladislav Markov on 16.07.2023.
//  Copyright © 2023 Vladislav Markov. All rights reserved.
//

import Combine
import Foundation
import NetworkLayer
import UIKit

@MainActor
final class PostListViewModel: ObservableObject {
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
        let request = PostRequestFactory.list.makeRequest()

        Task {
            do {
                let responses: [PostResponse] = try await networkClient.send(request)
                self.snapshot = self.makeSnapshot(postResponses: responses)
            } catch {
                self.error = .unknown(error)
            }
        }
    }

    func reloadData() {
        let currentSnapshot = snapshot
        snapshot = nil
        snapshot = currentSnapshot
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
