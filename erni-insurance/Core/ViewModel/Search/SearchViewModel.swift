//
//  SearchViewModel.swift
//  erni-search
//
//  Created by jeffrey milanes on 5/9/22.
//

import Foundation

protocol SearchViewModelProtocol {
    
    func didUpdateSearch()
}

class SearchViewModel: NSObject {
    
    var delegate: SearchViewModelProtocol?
    
    fileprivate(set) var search: [GetInsuranceEntity] = []

    func updateSearch(keyword: String) {
        
        let search = SearchInsuranceEntity.init(keyword: keyword)
        
        InsuranceManager.search(data: search) { result in
            switch result {
            case .success(let search):
                self.search = search
                self.delegate?.didUpdateSearch()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
