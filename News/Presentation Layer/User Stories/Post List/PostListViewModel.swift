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

final class PostListViewModel {
    
    // MARK: - Props
    var loadDataCompletion: ((Swift.Result<[TableSectionModel], PostError>) -> Void)?
    
    private var posts: [Post]
    private var isLoading: Bool
    
    // MARK: - Initialization
    init() {
        posts = []
        isLoading = false
    }
    
    // MARK: - Public functions
    public func loadData() {
        guard !isLoading else { return }
        isLoading = true
        NetworkClient.request(with: PostApiRouter.list)
            .responseDecodable(of: [PostResponse].self) { [weak self] response in
                defer { self?.isLoading = false }
                
                if let error = response.error {
                    self?.loadDataCompletion?(.failure(.unknown(error)))
                    return
                }
                guard let posts = response.value?.compactMap({ $0.defaultMapping() }) else {
                    self?.posts = []
                    self?.makeSectionsModel()
                    return
                }
                self?.posts = posts
                self?.makeSectionsModel()
            }
    }
    
}

// MARK: - Module functions
extension PostListViewModel {
    
    private func makeSectionsModel() {
        let mainSection = TableSectionModel()
        
        for post in posts {
            let postRow = PostListCellModel(title: post.title)
            postRow.userInfo["postId"] = post.id
            mainSection.rows.append(postRow)
        }
        
        loadDataCompletion?(.success([mainSection]))
    }
    
}

// MARK: - PostListViewModelInput
extension PostListViewModel: PostListViewModelInput {
    
    func configure(with data: Any?) { }
    
}
