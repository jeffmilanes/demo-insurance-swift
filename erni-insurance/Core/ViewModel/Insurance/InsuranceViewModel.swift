//
//  InsuranceViewModel.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/8/22.
//

import Foundation

protocol InsuranceViewModelProtocol {
    
    func didUpdateInsurance()
}

class InsuranceViewModel: NSObject {
    
    var delegate: InsuranceViewModelProtocol?
    
    fileprivate(set) var insurance: [GetInsuranceEntity] = []

    func updateInsurance() {
        
        InsuranceManager.fetchInsurance { result in
            switch result {
            case .success(let insurances):
                self.insurance = insurances
                self.delegate?.didUpdateInsurance()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

