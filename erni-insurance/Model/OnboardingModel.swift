//
//  OnboardingModel.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/9/22.
//

import Foundation

struct OnboardingModel: Codable {
    
    let id: Int
    let title, description, image: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case description
        case image
    }
}
