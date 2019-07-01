//
//  PostRouter.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostRouterInput: ViperRouterInput { }

class PostRouter: ViperRouter, PostRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: PostViewController? {
        guard let mainController = self._mainController as? PostViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - PostRouterInput
    
    // MARK: - Module functions
}
