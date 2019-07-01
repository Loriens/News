//
//  UploadFileEntity.swift
//
//  Created by  Кирилл on 21.08.2018.
//  Copyright © 2018 AppCraft. All rights reserved.
//

import Foundation
import GKExtensions

public struct UploadFileEntity {
    var filename: String
    var data: Data
    
    public init(filename: String, data: Data) {
        self.filename = filename
        self.data = data
    }
}
