//
//  NetworkService.swift
//  News
//
//  Created by Vladislav Markov on 16.03.2021.
//  Copyright © 2021 Vladislav Markov. All rights reserved.
//

import Alamofire

protocol NetworkService {
    func request(with convertible: URLRequestConvertible) -> DataRequest
}
