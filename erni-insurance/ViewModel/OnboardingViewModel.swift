//
//  OnboardingViewModel.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/9/22.
//

import Foundation

protocol OnboardingViewModelProtocol {
    
    func didUpdateOnboarding()
}
class OnboardingViewModel: NSObject {
    
    var delegate: OnboardingViewModelProtocol?
    
    fileprivate(set) var onboarding: [OnboardingModel] = []

    func updateOnboarding() {
        
        ApiService.getOnboarding { result in
            switch result {
            case .success(let onboarding):
                self.onboarding = onboarding
                self.delegate?.didUpdateOnboarding()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
