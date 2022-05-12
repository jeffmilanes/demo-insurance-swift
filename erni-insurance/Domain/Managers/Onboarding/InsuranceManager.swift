//
//  InsuranceManager.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation
import UIKit

class InsuranceManager {
   static func fetchInsurance(completion: @escaping (Result<[GetInsuranceEntity],Error>) -> Void) {
        InsuranceService.getInsurances { result in
            switch result {
            case .success(let insurance):
                let insurances = insurance.map { $0.fromGetInsuranceContract() }
                completion(.success(insurances))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func search(data: SearchInsuranceEntity,completion: @escaping (Result<[GetInsuranceEntity],Error>) -> Void) {
        InsuranceService.getInsurance(contract: data.fromSearchInsuranceEntity()) { result in
             switch result {
             case .success(let insurance):
                 let insurances = insurance.map { $0.fromGetInsuranceContract() }
                 completion(.success(insurances))
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
     }
    
    static func fetchCoverages(data: FindCoverageEntity,completion: @escaping (Result<[GetCoverageEntity],Error>) -> Void) {
        InsuranceService.getCoverages(contract: data.fromFindCoverageEntity()) { result in
             switch result {
             case .success(let coverage):
                 let coverages = coverage.map { $0.fromGetCoverageContract() }
                 completion(.success(coverages))
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
     }
}
