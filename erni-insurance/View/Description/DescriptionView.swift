//
//  DescriptionView.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit

class DescriptionView: UIViewController {

    @IBOutlet weak var viewBenefitsOuter: UIView!
    @IBOutlet weak var viewPremiumOuter: UIView!
    @IBOutlet weak var viewAdditionalInformationOuter: UIView!
    
    @IBOutlet weak var viewBenefitsHeader: UIView!
    @IBOutlet weak var viewPremiumHeader: UIView!
    @IBOutlet weak var viewAdditionalInformationHeader: UIView!
	
    @IBOutlet weak var viewBenefitsDetails: UIView!
    @IBOutlet weak var viewPremiumDetails: UIView!
    @IBOutlet weak var viewAdditionalInformationDetails: UIView!
    
    @IBOutlet weak var imageBenefits: UIImageView!
    @IBOutlet weak var imagePremium: UIImageView!
    @IBOutlet weak var imageAdditionalInformation: UIImageView!
   
    @IBOutlet weak var labelBenefits: UILabel!
    @IBOutlet weak var labelPremium: UILabel!
    @IBOutlet weak var labelAdditionalInformation: UILabel!
    
    var benefits: String?
    var premium: String?
    var additionalInformation: String?
    
    override func viewDidLoad() {

		super.viewDidLoad()

		navigationController?.navigationBar.prefersLargeTitles = false
		navigationItem.largeTitleDisplayMode = .never

		loadData()
        
        imageBenefits.isHighlighted = true
        imagePremium.isHighlighted = false
        imageAdditionalInformation.isHighlighted = false
        
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
        
        viewBenefitsOuter.layer.borderWidth = imageBenefits.isHighlighted ? 1 : 0
        viewPremiumOuter.layer.borderWidth = imagePremium.isHighlighted ? 1 : 0
        viewAdditionalInformationOuter.layer.borderWidth = imageAdditionalInformation.isHighlighted ? 1 : 0

        viewBenefitsOuter.layer.borderColor = AppColor.Border.cgColor
        viewPremiumOuter.layer.borderColor = AppColor.Border.cgColor
        viewAdditionalInformationOuter.layer.borderColor = AppColor.Border.cgColor

		viewBenefitsHeader.backgroundColor	= !imageBenefits.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground
        viewPremiumHeader.backgroundColor    = !imagePremium.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground
        viewAdditionalInformationHeader.backgroundColor    = !imageAdditionalInformation.isHighlighted ? UIColor.tertiarySystemFill : UIColor.systemBackground

		viewBenefitsDetails.isHidden	= !imageBenefits.isHighlighted
        viewPremiumDetails.isHidden    = !imagePremium.isHighlighted
        viewAdditionalInformationDetails.isHidden    = !imageAdditionalInformation.isHighlighted
	}

	// MARK: - User actions
	@IBAction func actionSubmit(_ sender: UIButton) {
        
        self.popupAlert(title: "Coming soon", message: "This feature is not yet available.", actionTitles: ["OK"], actionStyle: [.default], actions: [nil, { action in }], vc: self)
	}

	@IBAction func actionBenefits(_ sender: UIButton) {
        
		imageBenefits.isHighlighted = !imageBenefits.isHighlighted
		updateUI()
	}

	@IBAction func actionPremium(_ sender: UIButton) {
        
		imagePremium.isHighlighted = !imagePremium.isHighlighted
		updateUI()
	}
    
    @IBAction func actionAdditionalInformation(_ sender: UIButton) {
        
        imageAdditionalInformation.isHighlighted = !imageAdditionalInformation.isHighlighted
        updateUI()
    }
}
