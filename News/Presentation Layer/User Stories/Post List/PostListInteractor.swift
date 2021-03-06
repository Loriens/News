//
//  PostListInteractor.swift
//  News
//
//  Created by Vladislav Markov on 28.02.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

protocol PostListBusinessLogic {
    func getPostList(with request: PostListModule.GetPostList.Request)
    func openPost(with request: PostListModule.OpenPost.Request)
}

final class PostListInteractor: PostListBusinessLogic {
    private var presenter: PostListPresentationLogic
    private var worker: PostListWorker

    init(presenter: PostListPresentationLogic, worker: PostListWorker) {
        self.presenter = presenter
        self.worker = worker
    }

    func getPostList(with request: PostListModule.GetPostList.Request) {
        worker.getPostList { [weak self] result in
            let response = PostListModule.GetPostList.Response(result: result)
            self?.presenter.update(with: response)
        }
    }

    func openPost(with request: PostListModule.OpenPost.Request) {
        let response = PostListModule.OpenPost.Response(postId: request.postId)
        presenter.update(with: response)
    }
}
