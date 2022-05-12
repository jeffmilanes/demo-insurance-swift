//
//  SearchMapper.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

extension SearchInsuranceEntity {
    func fromSearchInsuranceEntity() -> SearchInsuranceContract {
        return .init(keyword: keyword)
    }
}
