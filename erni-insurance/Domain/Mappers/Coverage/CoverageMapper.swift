//
//  CoverageMapper.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

extension GetCoverageContract {
    func fromGetCoverageContract() -> GetCoverageEntity {
        return .init(type: type, description: description, benefits: benefits, premium: premium, additionalInfo: additionalInfo)
    }
}
