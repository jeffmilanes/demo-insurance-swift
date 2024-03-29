//
//  UIImageView+Extension.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit

extension UIImageView {

    func blank(_ topic: String, _ subtopic: String, _ index: Int) {

        let size = CGSize(width: 1, height: 1)
        let placeholder = UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.lightGray.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }

        self.image = placeholder
    }
}

