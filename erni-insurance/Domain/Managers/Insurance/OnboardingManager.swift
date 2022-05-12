//
//  OnboardingManager.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/12/22.
//

import Foundation

class OnboardingManager {
   static func fetchBoards(completion: @escaping (Result<[OnboardingEntity],Error>) -> Void) {
       OnboardingService.getOnboarding { result in
            switch result {
            case .success(let onboarding):
                let board = onboarding.map { $0.fromOnboardingContract() }
                completion(.success(board))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
