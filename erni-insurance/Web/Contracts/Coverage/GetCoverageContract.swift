//
//  CoverageContract.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

struct GetCoverageContract: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case type
        case description
        case benefits
        case premium
        case additionalInfo = "additional_info"
    }
    
    let type, description, benefits, premium, additionalInfo: String
}
