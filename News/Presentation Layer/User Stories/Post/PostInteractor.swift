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
            let response = PostModule.GetPost.Response(result: result)
            self?.presenter.update(with: response)
        }
    }
}
