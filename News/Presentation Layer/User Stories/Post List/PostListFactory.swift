//
//  PostListFactory.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import NetworkLayer
import UIKit

@MainActor
final class PostListFactory {
    init() {}

    func create() -> UIViewController {
        let networkClient = DefaultNetworkClient()
        let viewModel = PostListViewModel(networkClient: networkClient)
        let viewController = PostListView(viewModel: viewModel)
        viewController.router = PostListRouter(viewController: viewController)
        return viewController
    }
}
