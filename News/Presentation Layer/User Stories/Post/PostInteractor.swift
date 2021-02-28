//
//  PostInteractor.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

final class PostInteractor {
    private var presenter: PostPresenter
    private var worker: PostWorker

    init(presenter: PostPresenter, worker: PostWorker) {
        self.presenter = presenter
        self.worker = worker
    }

    func viewDidLoad() {
        worker.getPost { [weak self] (result) in
            switch result {
            case let .success(post):
                self?.presenter.refresh(with: post)
            case let .failure(error):
                self?.presenter.refresh(with: error)
            }
        }
    }
}
