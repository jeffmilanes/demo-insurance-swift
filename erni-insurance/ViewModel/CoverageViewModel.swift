//
//  CoverageViewModel.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/9/22.
//

import Foundation

protocol CoverageViewModelProtocol {
    
    func didUpdateCoverage()
}
class CoverageViewModel: NSObject {
    
    var delegate: CoverageViewModelProtocol?
    
    fileprivate(set) var coverage: [CoverageModel] = []

    func updateCoverage(id: Int) {
        ApiService.getCoverages(id: id) { result in
            switch result {
            case .success(let coverage):
                self.coverage = coverage
                self.delegate?.didUpdateCoverage()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
