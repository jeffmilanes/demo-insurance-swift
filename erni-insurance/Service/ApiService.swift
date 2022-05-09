//
//  ApiService.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/8/22.
//

import Foundation
import Alamofire

class ApiService {
    @discardableResult
    private static func performRequest<T:Decodable>(route: ApiRouter, decoder: JSONDecoder = JSONDecoder(), completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        
        return AF.request(route)
                        .responseDecodable (decoder: decoder){ (response: DataResponse<T, AFError>) in
                            completion(response.result)
        }
    }
    
    static func getOnboarding(completion:@escaping (Result<[OnboardingModel], AFError>)->Void) {
        
        let jsonDecoder = JSONDecoder()
        performRequest(route: ApiRouter.onboarding, decoder: jsonDecoder, completion: completion)
    }
    
    static func getInsurances(completion:@escaping (Result<[InsuranceModel], AFError>)->Void) {
        
        let jsonDecoder = JSONDecoder()
        performRequest(route: ApiRouter.insurances, decoder: jsonDecoder, completion: completion)
    }
    
    static func getInsurance(keyword: String, completion:@escaping (Result<[InsuranceModel], AFError>)->Void) {
        
        let jsonDecoder = JSONDecoder()
        performRequest(route: ApiRouter.insurance(keyword: keyword), decoder: jsonDecoder, completion: completion)
    }
    
    static func getCoverages(id: Int, completion:@escaping (Result<[CoverageModel], AFError>)->Void) {
        
        let jsonDecoder = JSONDecoder()
        performRequest(route: ApiRouter.coverages(id: id), decoder: jsonDecoder, completion: completion)
    }
}
