//
//  HomeView.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit

class HomeView: UIViewController {

	@IBOutlet var viewTitle: UIView!
	@IBOutlet var labelTitle: UILabel!
	@IBOutlet var collectionView: UICollectionView!

    fileprivate let vm = InsuranceViewModel()
    
    var activityView: UIActivityIndicatorView?

	override func viewDidLoad() {

		super.viewDidLoad()
        
        labelTitle.text = "Insurance Demo".localized()
        
        self.showSpinner()
        
		navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewTitle)
        rightBarButtonItem(iconNameButton: "Search", selector: #selector(actionSearch))
        
		collectionView.register(UINib(nibName: "HomeCell1", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeCell1")
		collectionView.register(UINib(nibName: "HomeCell2", bundle: Bundle.main), forCellWithReuseIdentifier: "HomeCell2")

		loadData()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        vm.updateInsurance()
    }
    
    func rightBarButtonItem(iconNameButton: String, selector: Selector) {
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        button.setImage(UIImage(named: iconNameButton), for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit

        let buttonBarButton = UIBarButtonItem(customView: UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30)))
        buttonBarButton.customView?.addSubview(button)
        buttonBarButton.customView?.frame = button.frame

        self.navigationItem.rightBarButtonItem = buttonBarButton
    }

	// MARK: - Data methods
	func loadData() {
        
        vm.delegate = self
		refreshCollectionViewProducts()
	}

	// MARK: - Refresh methods
	func refreshCollectionViewProducts() {
        
		collectionView.reloadData()
	}

	// MARK: - User actions
	@objc func actionSearch(_ sender: UIButton) {
        
        let searchView = SearchView()
        navigationController?.pushViewController(searchView, animated: true)
	}
}

// MARK: - UICollectionViewDataSource
extension HomeView: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return vm.insurance.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		if (indexPath.row == 0) {
            
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell1", for: indexPath) as! HomeCell1
            cell.bindData(index: indexPath, data: vm.insurance[indexPath.row])
			return cell
		} else {
            
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell2", for: indexPath) as! HomeCell2
            cell.bindData(index: indexPath, data: vm.insurance[indexPath.row])
			return cell
		}

	}
}

// MARK: - UICollectionViewDelegate
extension HomeView: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let detailsView = DetailsView()
        detailsView.id = vm.insurance[indexPath.row].id
        detailsView.imagePath = vm.insurance[indexPath.row].image
        detailsView.titleText = vm.insurance[indexPath.row].product
        detailsView.descriptionText = vm.insurance[indexPath.row].description
        
        navigationController?.pushViewController(detailsView, animated: true)
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeView: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let width = collectionView.frame.size.width
		let height = (collectionView.frame.size.height-45)/2

        if (indexPath.row == 0) {
            return CGSize(width: width-30, height: height)
            
        } else {
            return CGSize(width: (width-45)/2, height: height) }
	}
}

extension HomeView: InsuranceViewModelProtocol {
    
    func didUpdateInsurance() {
        
        loadData() 
        self.removeSpinner()
    }
}
