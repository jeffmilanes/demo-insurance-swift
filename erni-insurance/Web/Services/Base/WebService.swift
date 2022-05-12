//
//  ApiRouter.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/8/22.
//

import Alamofire

enum WebService: URLRequestConvertible {
    case get(path: String, paramters: Parameters?)
    case post(path: String,  paramters: Parameters?)
    case put(path: String,  paramters: Parameters?)
    case delete(path: String,  paramters: Parameters?)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .get:
            return .get
        case .post:
            return .post
        case .put:
            return .put
        case .delete:
            return .delete
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .get(let path, _):
            return path
        case .post(let path, _):
            return path
        case .put(let path, _):
            return path
        case .delete(let path, _):
            return path
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .get(_, let param):
            return param
        case .post(_, let param):
            return param
        case .put(_, let param):
            return param
        case .delete(_, let param):
            return param
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        let url = try ApiEndpoints.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
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

