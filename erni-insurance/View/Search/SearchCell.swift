//
//  SearchCell.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit

class SearchCell: UITableViewCell {

	@IBOutlet var productName: UILabel!
	@IBOutlet var productDescription: UILabel!

	func bindData(index: Int, data: InsuranceModel) {

        productName.text = data.product
        productDescription.text = data.description
	}
}
