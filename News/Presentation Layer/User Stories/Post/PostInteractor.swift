//
//  PostInteractor.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostInteractorInput: ViperInteractorInput {
    func loadPost()
}

protocol PostInteractorOutput: ViperInteractorOutput {
    func providePost(_ post: Post?)
}

open class PostInteractor: ViperInteractor, PostInteractorInput {

    // MARK: - Props
    private var output: PostInteractorOutput? {
        guard let output = self._output as? PostInteractorOutput else {
            return nil
        }
        return output
    }
    
    private var postId: Int
    
    // MARK: - Initialization
    init(postId: Int) {
        self.postId = postId
        
        super.init()
    }
    
    // MARK: - PostInteractorInput
    func loadPost() {
        guard let request = PostRemoteRouter.item(postId: self.postId).request else { return }
        
        self.output?.beginLoading()
        let _: PostResponse? = self.execute(request, onSuccess: self.getPostSuccess, onError: self.getPostError)
    }
    
    // MARK: - Module functions
    private func getPostSuccess(result: PostResponse?, response: URLResponse?) {
        self.output?.finishLoading(with: nil)
        
        guard let result = result else {
            self.output?.providePost(nil)
            
            return
        }
        
        let post = result.defaultMapping()
        
        self.output?.providePost(post)
    }
    
    private func getPostError(error: Error?, response: URLResponse?) {
        self.output?.finishLoading(with: error)
    }
}
