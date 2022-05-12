//
//  OnboardingContract.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

struct OnboardingContract: Decodable {
    
    let id: Int
    let title, description, image: String
}
