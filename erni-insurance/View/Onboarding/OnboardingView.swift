//
//  OnboardingView.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit


class OnboardingView: UIViewController {

	@IBOutlet var collectionView: UICollectionView!
	@IBOutlet var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!
    
    fileprivate let vm = OnboardingViewModel()
    
    var window: UIWindow?
    var homeView: HomeView!

	override func viewDidLoad() {

		super.viewDidLoad()
        
        self.showSpinner()

		collectionView.register(UINib(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCell")

		pageControl.pageIndicatorTintColor = UIColor.lightGray
		pageControl.currentPageIndicatorTintColor = AppColor.Theme

		loadCollections()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        vm.updateOnboarding()
    }

	// MARK: - Collections methods
	func loadCollections() {
        vm.delegate = self
        
        pageControl.numberOfPages = vm.onboarding.count
		refreshCollectionView()
	}

	// MARK: - User actions
	@IBAction func actionSkip(_ sender: UIButton) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        homeView = HomeView()
        let navController = NavigationController(rootViewController: homeView)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
	}

	// MARK: - Refresh methods
	func refreshCollectionView() {

		collectionView.reloadData()
	}
}

// MARK:- UICollectionViewDataSource
extension OnboardingView: UICollectionViewDataSource {

	func numberOfSections(in collectionView: UICollectionView) -> Int {

		return 1
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return vm.onboarding.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        cell.bindData(index: indexPath.item, data: vm.onboarding[indexPath.row])
		return cell
	}
}

// MARK:- UICollectionViewDelegate
extension OnboardingView: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		print("didSelectItemAt \(indexPath.row)")
	}

	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (indexPath.row == vm.onboarding.count - 1) {
            skipButton.setTitle("Next", for: .normal)
        }

		pageControl.currentPage = indexPath.row
	}
}

// MARK:- UICollectionViewDelegateFlowLayout
extension OnboardingView: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		let height = collectionView.frame.size.height
		let width = collectionView.frame.size.width

		return CGSize(width: width, height: height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

		return 0
	}
}

extension OnboardingView: OnboardingViewModelProtocol {
    
    func didUpdateOnboarding() {
        
        loadCollections()
        self.removeSpinner()
    }
}
