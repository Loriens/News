//
//  PostListInteractor.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostListInteractorInput: ViperInteractorInput {
    func loadPosts()
}

protocol PostListInteractorOutput: ViperInteractorOutput {
    func providePosts(_ posts: [Post])
}

open class PostListInteractor: ViperInteractor, PostListInteractorInput {

    // MARK: - Props
    private var output: PostListInteractorOutput? {
        guard let output = self._output as? PostListInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - PostListInteractorInput
    func loadPosts() {
        guard let request = PostRemoteRouter.list.request else { return }
        
        self.output?.beginLoading()
        let _: [PostResponse]? = self.execute(request, onSuccess: self.getPostsSuccess, onError: self.getPostsError)
    }
    
    // MARK: - Module functions
    private func getPostsSuccess(result: [PostResponse]?, response: URLResponse?) {
        self.output?.finishLoading(with: nil)
        
        guard let result = result else {
            self.output?.providePosts([])
            
            return
        }
        
        var posts: [Post] = []
        for item in result {
            guard let postItem = item.defaultMapping() else { continue }
            posts.append(postItem)
        }
        
        self.output?.providePosts(posts)
    }
    
    private func getPostsError(error: Error?, response: URLResponse?) {
        self.output?.finishLoading(with: error)
    }
}
