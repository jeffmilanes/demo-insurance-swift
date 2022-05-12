//
//  FindCoverageMapper.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

extension FindCoverageEntity {
    func fromFindCoverageEntity() -> FindCoverageContract {
        return .init(id: id)
    }
}
