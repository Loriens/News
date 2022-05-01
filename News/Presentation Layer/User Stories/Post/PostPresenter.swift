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
        let viewModel: PostModule.GetPost.ViewModel
        switch response.result {
        case .success(let postResponse):
            if let body = postResponse.body {
                let post = PostModule.Post(id: postResponse.id, body: body)
                viewModel = .init(result: .success(post))
            } else {
                viewModel = .init(result: .failure(.emptyPost))
            }
        case .failure(let error):
            viewModel = .init(result: .failure(.unknown(error)))
        }
        DispatchQueue.main.async {
            self.viewController?.update(with: viewModel)
        }
    }
}
