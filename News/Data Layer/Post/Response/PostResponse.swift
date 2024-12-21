//
//  PostResponse.swift
//  News
//
//  Created by Markov Vladislav on 01.05.2022.
//  Copyright © 2022 Vladislav Markov. All rights reserved.
//

struct PostResponse: Decodable {
    let id: Int
    let title: String
    let body: String?
}
