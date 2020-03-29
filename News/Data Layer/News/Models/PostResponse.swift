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
    var text: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case text = "body"
    }
    
    func defaultMapping() -> Post? {
        guard let id = self.id else { return nil }
        
        let post = Post(
            id: id,
            title: title ?? "",
            text: text ?? ""
        )
        
        return post
    }
    
}
