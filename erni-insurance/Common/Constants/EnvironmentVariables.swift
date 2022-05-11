//
//  EnvironmentVariables.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/11/22.
//

import Foundation

struct EnvironmentVariables {
    static let appServerUrl = Bundle.main.object(forInfoDictionaryKey: "ApiServerUrl") as! String
}
