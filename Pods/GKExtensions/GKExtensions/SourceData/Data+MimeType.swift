//
//  Data+MimeType.swift
//  Trade Union
//
//  Created by  Кирилл on 1/15/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

public extension Data {
    
    private static let mimeTypeSignatures: [UInt8: String] = [0xFF: "image/jpeg",
                                                              0x89: "image/png",
                                                              0x47: "image/gif",
                                                              0x49: "image/tiff",
                                                              0x4D: "image/tiff",
                                                              0x25: "application/pdf",
                                                              0xD0: "application/vnd",
                                                              0x46: "text/plain"]
    
    public var mimeType: String {
        var code: UInt8 = 0
        copyBytes(to: &code, count: 1)
        return Data.mimeTypeSignatures[code] ?? "application/octet-stream"
    }

}
