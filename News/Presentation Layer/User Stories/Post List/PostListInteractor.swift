//
//  PostListInteractor.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

final class PostListInteractor {
    private var presenter: PostListPresenter
    private var worker: PostListWorker

    init(presenter: PostListPresenter, worker: PostListWorker) {
        self.presenter = presenter
        self.worker = worker
    }

    func viewDidLoad() {
        loadData()
    }

    func loadData() {
        worker.getPostList { [weak self] (result) in
            switch result {
            case let .success(posts):
                self?.presenter.refresh(with: posts)
            case let .failure(error):
                self?.presenter.refresh(with: error)
            }
        }
    }

    func postDidSelect(post: PostListModule.Post) {
        presenter.route(action: .openPost(id: post.id))
    }
}
