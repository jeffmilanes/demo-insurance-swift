//
//  Localize.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/11/22.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
}
