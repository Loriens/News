//
//  PostListViewModel.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

class PostListViewModel: ViperViewModel {
    var posts: [Post]
    
    override init() {
        posts = []
    }
}
