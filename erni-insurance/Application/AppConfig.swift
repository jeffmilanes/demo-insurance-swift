//
//  Constants.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/8/22.
//

import Foundation

struct AppConfig {
    
    struct ProductionServer {
        
        static let baseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as! String
    }
}

enum HTTPHeaderField: String {
    
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    
    case json = "application/json"
}
