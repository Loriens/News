//
//  NetworkWorker.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import GKExtensions

public class NetworkWorker {
    
    private var activeTasks: [String: URLSessionDataTask]
    
    public init() {
        self.activeTasks = [:]
    }
    
    public func execute<T: Codable>(_ request: URLRequest, completion: @escaping (_ result: T?, _ response: URLResponse?, _ error: Error?) -> Void) {
        guard let taskAbsoluteString: String = request.url?.absoluteString else {
            let invalidRequestError = NSError(domain: "[NetworkWorker] - Invalid request",
                                              code: 400,
                                              userInfo: nil)
            completion(nil, nil, invalidRequestError)
            
            return
        }
        if self.activeTasks[taskAbsoluteString] != nil {
            self.activeTasks[taskAbsoluteString]?.cancel()
        }
        
        let newTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let receivedData = data, let receivedResponse = response as? HTTPURLResponse, error == nil {
                print("[NetworkWorker] - Response: \(receivedResponse)")
                
                switch receivedResponse.statusCode {
                case 200:
                    if let ok = String(data: receivedData, encoding: .utf8), ok.lowercased() == "ok" {
                        self.activeTasks[taskAbsoluteString] = nil
                        completion(nil, receivedResponse, nil)
                        
                        return
                    }
                    
                    do {
                        let jsonDecoder = JSONDecoder()
                        let object = try jsonDecoder.decode(T.self, from: receivedData)
                        print("[NetworkWorker] - Data: \(object)")
                        
                        self.activeTasks[taskAbsoluteString] = nil
                        completion(object, receivedResponse, nil)
                    } catch let parsingError {
                        self.activeTasks[taskAbsoluteString] = nil
                        completion(nil, receivedResponse, parsingError)
                    }
                default:
                    let serverError = NSError(domain: "",
                                              code: receivedResponse.statusCode,
                                              userInfo: nil)
                    self.activeTasks[taskAbsoluteString] = nil
                    completion(nil, receivedResponse, serverError)
                }
            } else {
                print("[NetworkWorker] - Error: \(error?.localizedDescription ?? "no error")")
                if let receivedResponse = response as? HTTPURLResponse {
                    print("[NetworkWorker] - Response: \(receivedResponse)")
                    self.activeTasks[taskAbsoluteString] = nil
                    completion(nil, receivedResponse, error)
                } else {
                    self.activeTasks[taskAbsoluteString] = nil
                    completion(nil, nil, error)
                }
            }
            
        }
        
        self.activeTasks[taskAbsoluteString] = newTask
        self.activeTasks[taskAbsoluteString]?.resume()
    }
    
    public func cancel(_ request: URLRequest) {
        guard let taskAbsoluteString: String = request.url?.absoluteString else { return }
        
        if self.activeTasks[taskAbsoluteString] != nil {
            self.activeTasks[taskAbsoluteString]?.cancel()
        }
    }
    
}
