//
//  Post.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

public class Post: Equatable {
    var id: Int
    var title: String
    var text: String
    
    init(id: Int) {
        self.id = id
        self.title = ""
        self.text = ""
    }
    
    static public func == (lhs: Album, rhs: Album) -> Bool {
        return lhs.id == rhs.id
            && lhs.title == rhs.title
    }
}
