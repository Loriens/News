//
//  PostListViewModel.swift
//  News
//
//  Created by Vladislav on 24.11.2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Alamofire

protocol PostListViewModelInput {
    func configure(with data: Any?)
}

class PostListViewModel {
    
    // MARK: - Props
    private var posts: [Post]
    private var isLoading = false
    private weak var view: PostListViewInput?
    
    // MARK: - Initialization
    init(with view: PostListViewInput?) {
        self.view = view
        self.posts = []
    }
    
    // MARK: - Public functions
    public func loadData() {
        guard !isLoading else { return }
        isLoading = true
        PostAPIClient.list(completion: postListResult)
    }
    
}

// MARK: - Module functions
extension PostListViewModel {
    
    private func postListResult(result: Result<[PostResponse]?>) {
        isLoading = false
        
        switch result {
        case let .success(postsResponse):
            let posts = postsResponse?.compactMap({ $0.defaultMapping() }) ?? []
            self.posts = posts
            
            makeSectionsModel()
        case let .failure(error):
            error.show()
        }
    }
    
    private func makeSectionsModel() {
        let mainSection = TableSectionModel()
        
        for post in posts {
            let postRow = PostListCellModel(title: post.title)
            postRow.userInfo["postId"] = post.id
            mainSection.rows.append(postRow)
        }
        
        self.view?.updateForSections([mainSection])
    }
    
}

// MARK: - PostListViewModelInput
extension PostListViewModel: PostListViewModelInput {
    
    func configure(with data: Any?) { }
    
}
