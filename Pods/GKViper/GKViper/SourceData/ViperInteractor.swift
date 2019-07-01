//
//  ViperInteractor.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import UIKit
import GKNetwork
import GKExtensions

public protocol ViperInteractorInput: AnyObject {
    var _output: ViperInteractorOutput? { get set }
    
    func configure(with data: Any?)
}

public protocol ViperInteractorOutput: AnyObject {
    func beginLoading()
    func finishLoading(with error: Error?)
    func provideMessage(_ title: String?, message: String?)
}

open class ViperInteractor: ViperInteractorInput {
    
    // MARK: - Props
    public var networkWorker: NetworkWorker
    
    public weak var _output: ViperInteractorOutput?
    
    // MARK: - Initialization
    public init() {
        self.networkWorker = NetworkWorker()
    }

    // MARK: - ViperInteractorInputProtocol
    open func configure(with data: Any?) { }
    
    // MARK: - Module functions
    open func execute<T: Codable>(_ request: URLRequest, onSuccess: @escaping (_ result: T?, _ response: URLResponse?) -> Void, onError: @escaping (_ error: Error?, _ response: URLResponse?) -> Void) -> T? {
        self.networkWorker.execute(request) { (result: T?, response, error) in
            if let receivedResponse = response as? HTTPURLResponse {
                switch receivedResponse.statusCode {
                case 200:
                    onSuccess(result, receivedResponse)
                default:
                    onError(error, receivedResponse)
                }
            } else {
                onError(error, response)
            }
        }
        
        return nil
    }
}
