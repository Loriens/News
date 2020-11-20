//
//  PostResponse.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import Foundation

struct PostResponse: Codable {
    
    var id: Int?
    var title: String?
    var body: String?
    
    func defaultMapping() -> Post? {
        guard let id = id else { return nil }
        
        let post = Post(
            id: id,
            title: title ?? "",
            text: body ?? ""
        )
        
        return post
    }
    
}
