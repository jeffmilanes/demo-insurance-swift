//
//  Constants.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/8/22.
//

import Foundation

enum HTTPHeaderField: String {
    
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    
    case json = "application/json"
}
