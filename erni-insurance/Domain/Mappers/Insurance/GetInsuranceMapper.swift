//
//  InsuranceMapper.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

extension GetInsuranceContract {
    func fromGetInsuranceContract() -> GetInsuranceEntity {
        return .init(id: id, product: product, description: description, image: image)
    }
}


