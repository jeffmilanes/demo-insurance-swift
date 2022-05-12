//
//  DescriptionView.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit

class DescriptionView: UIViewController {
    @IBOutlet weak var titleBenefits: UILabel!
    @IBOutlet weak var titlePremium: UILabel!
    @IBOutlet weak var titleAdditionalInformation: UILabel!
    
    @IBOutlet weak var viewBenefitsOuter: UIView!
    @IBOutlet weak var viewPremiumOuter: UIView!
    @IBOutlet weak var viewAdditionalInformationOuter: UIView!
    
    @IBOutlet weak var viewBenefitsHeader: UIView!
    @IBOutlet weak var viewPremiumHeader: UIView!
    @IBOutlet weak var viewAdditionalInformationHeader: UIView!
	
    @IBOutlet weak var viewBenefitsDetails: UIView!
    @IBOutlet weak var viewPremiumDetails: UIView!
    @IBOutlet weak var viewAdditionalInformationDetails: UIView!
   
    @IBOutlet weak var labelBenefits: UILabel!
    @IBOutlet weak var labelPremium: UILabel!
    @IBOutlet weak var labelAdditionalInformation: UILabel!
    
    @IBOutlet weak var insuranceButton: UIButton!
    
    var benefits: String?
    var premium: String?
    var additionalInformation: String?
    
    override func viewDidLoad() {

		super.viewDidLoad()
        
        titleBenefits.text = "Benefits".localized()
        titlePremium.text = "Premium".localized()
        titleAdditionalInformation.text = "Additional Information".localized()
        
        insuranceButton.setTitle("Buy your insurance".localized().uppercased(), for: .normal)

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		loadData()
        
		updateUI()
	}

	// MARK: - Data methods
	func loadData() {
        
        labelBenefits.text = benefits
        labelPremium.text = premium
        labelAdditionalInformation.text = additionalInformation
	}

	// MARK: - Helper methods
	func updateUI() {

		viewBenefitsOuter.layer.cornerRadius = 10
		viewPremiumOuter.layer.cornerRadius = 10
        viewAdditionalInformationOuter.layer.cornerRadius = 10
        
        viewBenefitsOuter.layer.borderWidth = 1
        viewPremiumOuter.layer.borderWidth = 1
        viewAdditionalInformationOuter.layer.borderWidth = 1

        viewBenefitsOuter.layer.borderColor = AppColor.Border.cgColor
        viewPremiumOuter.layer.borderColor = AppColor.Border.cgColor
        viewAdditionalInformationOuter.layer.borderColor = AppColor.Border.cgColor
	}

	// MARK: - User actions
	@IBAction func actionSubmit(_ sender: UIButton) {
        
        self.popupAlert(title: "Coming soon".localized(), message: "This feature is not yet available".localized(), actionTitles: ["Ok".localized().uppercased()], actionStyle: [.default], actions: [nil, { action in }], vc: self)
	}
}
