//
//  HomeCell2.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit
import Kingfisher

class HomeCell2: UICollectionViewCell {

	@IBOutlet var imageProduct: UIImageView!
	@IBOutlet var labelTitle: UILabel!
    @IBOutlet weak var viewGradient: UIView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0).cgColor, UIColor.black.withAlphaComponent(0.7).cgColor]
        gradientLayer.locations = [0.0, 0.3, 1.0]
        gradientLayer.frame = CGRect(origin: CGPoint(x: 0, y: viewGradient.bounds.size.height * 0.3), size: CGSize(width: viewGradient.bounds.size.width, height: viewGradient.bounds.size.height))
        viewGradient.layer.addSublayer(gradientLayer)
    }

	func bindData(index: IndexPath, data: GetInsuranceEntity) {
        
        labelTitle.text = data.product
        imageProduct.kf.indicatorType = .activity
        imageProduct.kf.setImage(with: URL(string: data.image))
	}
}
