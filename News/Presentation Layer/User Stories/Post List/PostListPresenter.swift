//
//  PostListPresenter.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostListPresenterInput: ViperPresenterInput { }

class PostListPresenter: ViperPresenter, PostListPresenterInput, PostListViewOutput, PostListInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: PostListViewInput? {
        guard let view = self._view as? PostListViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: PostListInteractorInput? {
        guard let interactor = self._interactor as? PostListInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: PostListRouterInput? {
        guard let router = self._router as? PostListRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: PostListViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = PostListViewModel()
    }
    
    // MARK: - PostListPresenterInput
    func selectPost(id: Int) {
        _ = self.router?.pushPostViewController(postId: id)
    }
    
    // MARK: - PostListViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
        
        self.interactor?.loadPosts()
    }
    
    // MARK: - PostListInteractorOutput
    func providePosts(_ posts: [Post]) {
        self.viewModel.posts = posts
        
        self.makeSectionsModel()
    }
    
    // MARK: - Module functions
    private func makeSectionsModel() {
        let mainSection = TableSectionModel()
        
        for post in self.viewModel.posts {
            let postRow = PostListCellModel(title: post.title)
            postRow.userInfo["postId"] = post.id
            mainSection.rows.append(postRow)
        }
        
        self.view?.updateForSections([mainSection])
    }
}
