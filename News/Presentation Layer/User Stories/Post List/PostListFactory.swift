//
//  PostListFactory.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import NetworkLayer

final class PostListFactory {
    init() { }

    func create() -> PostListView {
        let viewController = PostListView()
        let presenter = PostListPresenter(viewController: viewController)
        let networkClient = DefaultNetworkClient()
        let worker = PostListWorker(networkClient: networkClient)
        let interactor = PostListInteractor(presenter: presenter, worker: worker)
        viewController.interactor = interactor
        viewController.router = PostListRouter(viewController: viewController)
        return viewController
    }
}
