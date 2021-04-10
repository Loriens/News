//
//  PostPresenter.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Foundation

protocol PostPresentationLogic {
    func update(with response: PostModule.GetPost.Response)
}

final class PostPresenter: PostPresentationLogic {
    private weak var viewController: PostViewDisplayLogic?

    init(viewController: PostViewDisplayLogic) {
        self.viewController = viewController
    }

    func update(with response: PostModule.GetPost.Response) {
        let viewModel = PostModule.GetPost.ViewModel(result: response.result)
        DispatchQueue.main.async {
            self.viewController?.update(with: viewModel)
        }
    }
}
