//
//  DetailsView.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit
import Kingfisher

class DetailsView: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet var tableView: UITableView!
	@IBOutlet var constraintTableViewHeight: NSLayoutConstraint!
    
    fileprivate let vm = CoverageViewModel()
    
    var id: Int?
    var imagePath: String?
    var titleText: String?
    var descriptionText: String?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.showSpinner()
        
        tableView.register(UINib(nibName: "DetailsCell", bundle: nil), forCellReuseIdentifier: "DetailsCell")
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        vm.updateCoverage(id: id!)
        
        self.tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        self.tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "contentSize"
        {
            if object is UITableView
            {
                if let newvalue = change?[.newKey] {
                    let newsize = newvalue as! CGSize
                    self.constraintTableViewHeight.constant = newsize.height + 20 // add space
                }
            }
        }
    }

	// MARK: - Data methods

    func loadData() {
        
        vm.delegate = self
        
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: imagePath!))
        titleLabel.text = titleText!
        descriptionLabel.text = descriptionText!
        
        refreshTableView()
    }


	// MARK: - Refresh methods

	func refreshTableView() {
        
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource

extension DetailsView: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return vm.coverage.count
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return UITableView.automaticDimension
	}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath) as! DetailsCell
        cell.bindData(index: indexPath.item, data: vm.coverage[indexPath.row])
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DetailsView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("didSelectItemAt \(indexPath.row)")
        
        let descriptionView = DescriptionView()
        
        descriptionView.benefits = vm.coverage[indexPath.row].benefits
        descriptionView.premium = vm.coverage[indexPath.row].premium
        descriptionView.additionalInformation = vm.coverage[indexPath.row].additionalInfo
        
        navigationController?.pushViewController(descriptionView, animated: true)
    }
}

extension DetailsView: CoverageViewModelProtocol {
    func didUpdateCoverage() {
        
        loadData() 
        self.removeSpinner()
    }
}
