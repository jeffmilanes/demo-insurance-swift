//
//  OnboardingCell.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit


class OnboardingCell: UICollectionViewCell {

	@IBOutlet var imageView: UIImageView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var labelDescription: UILabel!

	func bindData(index: Int, data: OnboardingEntity) {
        labelTitle.text = data.title
        labelDescription.text = data.description
        
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.layer.masksToBounds = true
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: data.image))
       
	}
}
