//
//  OnboardingService.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/11/22.
//

import Foundation
import Alamofire

class OnboardingService {
    static func getOnboarding(completion:@escaping (Result<[OnboardingContract], AFError>)->Void) {
        
        let jsonDecoder = JSONDecoder()
        AlamofireProvider.performRequest(request: WebService.get(path: ApiEndpoints.onBoardings, paramters: nil), decoder: jsonDecoder, completion: completion)
    }
}
