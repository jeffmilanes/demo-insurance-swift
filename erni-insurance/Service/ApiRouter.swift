//
//  ApiRouter.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/8/22.
//

import Alamofire

enum ApiRouter: URLRequestConvertible {
    case onboarding
    case insurances
    case insurance(keyword: String)
    case coverages(id: Int)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        
        switch self {
        case .onboarding:
            return .get 
        case .insurances:
            return .get
        case .insurance(_):
            return .get
        case .coverages(_):
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        
        switch self {
        case .onboarding:
            return "/onboarding/all"
        case .insurances:
            return "/insurance/all"
        case .insurance(let keyword):
            return "/insurance/search/\(keyword)"
        case .coverages(let id):
            return "/insurance/coverage/\(id)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        
        return nil
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
