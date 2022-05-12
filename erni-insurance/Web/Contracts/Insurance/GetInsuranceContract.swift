//
//  InsuranceContract.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

struct GetInsuranceContract: Decodable {
    
    let id: Int
    let product, description, image: String
}
