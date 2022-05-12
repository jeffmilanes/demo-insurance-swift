//
//  InsuranceService.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/11/22.
//

import Foundation
import Alamofire

class InsuranceService {
    static func getInsurances(completion:@escaping (Result<[GetInsuranceContract], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        AlamofireProvider.performRequest(request: WebService.get(path: ApiEndpoints.insurances, paramters: nil), decoder: jsonDecoder, completion: completion)
    }
    
    static func getInsurance(contract: SearchInsuranceContract, completion:@escaping (Result<[GetInsuranceContract], AFError>)->Void) {
        let jsonDecoder = JSONDecoder()
        AlamofireProvider.performRequest(request: WebService.get(path: ApiEndpoints.searchInsurance + contract.keyword, paramters: nil), decoder: jsonDecoder, completion: completion)
    }
    
    static func getCoverages(contract: FindCoverageContract, completion:@escaping (Result<[GetCoverageContract], AFError>)->Void) {
        
        let jsonDecoder = JSONDecoder()
        AlamofireProvider.performRequest(request: WebService.get(path: ApiEndpoints.coverages + "\(contract.id)", paramters: nil), decoder: jsonDecoder, completion: completion)
    }
}
