//
//  SearchCell.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit
import Kingfisher

class SearchCell: UITableViewCell {

	@IBOutlet var productName: UILabel!
	@IBOutlet var productDescription: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
	func bindData(index: Int, data: GetInsuranceEntity) {

        productName.text = data.product
        productDescription.text = data.description
        productImage.layer.cornerRadius = 5
        productImage.kf.indicatorType = .activity
        productImage.kf.setImage(with: URL(string: data.image))
	}
}
