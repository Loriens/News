//
//  PostInteractor.swift
//  News
//
//  Created by Vladislav on 01/07/2019.
//  Copyright © 2019 Vladislav Markov. All rights reserved.
//

import GKViper

protocol PostInteractorInput: ViperInteractorInput { }

protocol PostInteractorOutput: ViperInteractorOutput { }

open class PostInteractor: ViperInteractor, PostInteractorInput {

    // MARK: - Props
    private var output: PostInteractorOutput? {
        guard let output = self._output as? PostInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - PostInteractorInput
    
    // MARK: - Module functions
}
