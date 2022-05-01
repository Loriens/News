//
//  PostInteractor.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

protocol PostBusinessLogic {
    func getPost(request: PostModule.GetPost.Request)
}

final class PostInteractor: PostBusinessLogic {
    private var presenter: PostPresentationLogic
    private var worker: PostWorker

    init(presenter: PostPresentationLogic, worker: PostWorker) {
        self.presenter = presenter
        self.worker = worker
    }

    func getPost(request: PostModule.GetPost.Request) {
        worker.getPost { [weak self] result in
            let response: PostModule.GetPost.Response
            switch result {
            case .success(let post):
                if post.body == nil {
                    response = .init(result: .failure(.emptyPost))
                } else {
                    response = .init(result: .success(post))
                }
            case .failure(let error):
                response = .init(result: .failure(.unknown(error)))
            }
            self?.presenter.update(with: response)
        }
    }
}
