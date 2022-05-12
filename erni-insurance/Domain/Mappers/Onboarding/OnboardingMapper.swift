//
//  OnboardingMapper.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

extension OnboardingContract {
    func fromOnboardingContract() -> OnboardingEntity {
        return .init(id: id, title: title, description: description, image: image)
    }
}
