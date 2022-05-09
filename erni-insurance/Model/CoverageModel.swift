//
//  DetailsModel.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/9/22.
//

import Foundation

struct CoverageModel: Codable {
    
    let type, description, benefits, premium, additionalInfo: String
    
    enum CodingKeys: String, CodingKey {
        
        case type
        case description
        case benefits
        case premium
        case additionalInfo = "additional_info"
    }
}
