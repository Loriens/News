//
//  PostPresenter.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostPresenterInput: ViperPresenterInput { }

class PostPresenter: ViperPresenter, PostPresenterInput, PostViewOutput, PostInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: PostViewInput? {
        guard let view = self._view as? PostViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: PostInteractorInput? {
        guard let interactor = self._interactor as? PostInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: PostRouterInput? {
        guard let router = self._router as? PostRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: PostViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = PostViewModel()
    }
    
    // MARK: - PostPresenterInput
    
    // MARK: - PostViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    // MARK: - PostInteractorOutput
    
    // MARK: - Module functions
}
