//
//  ApiService.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/8/22.
//

import Foundation
import Alamofire

class AlamofireProvider {
     @discardableResult
     static func performRequest<T:Decodable>(request: WebService, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        
        return AF.request(request)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
}
