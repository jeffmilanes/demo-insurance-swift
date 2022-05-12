//
//  SearchCell.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit

class DetailsCell: UITableViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    
    func bindData(index: Int, data: GetCoverageEntity) {

        productName.text = data.type
        productDescription.text = data.description
	}
}
