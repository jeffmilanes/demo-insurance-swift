//
//  ApiEndpoints.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/11/22.
//

import Foundation

struct ApiEndpoints {
    static let baseUrl = "\(EnvironmentVariables.appServerUrl)/api"
    static let onBoardings = "/onboarding/all"
    static let insurances = "/insurance/all"
    static let searchInsurance = "/insurance/search"
    static let coverages = "/insurance/coverage"
}
