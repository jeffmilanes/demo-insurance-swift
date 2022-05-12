//
//  SearchView.swift
//  erni-insurance
//
//  Created by jeffrey milanes on 5/5/22.
//

import UIKit

class SearchView: UIViewController {
    
    @IBOutlet weak var titleSearch: UILabel!
    @IBOutlet weak var titleDescription: UILabel!
    
	@IBOutlet var viewHeader: UIView!
	@IBOutlet var searchBar: UISearchBar!
	@IBOutlet var tableView: UITableView!

    
    var debounceTimer: Timer?
    
	private var navigationBackgroundImage: UIImage?
	
    fileprivate let vm = SearchViewModel()

	override func viewDidLoad() {
        
		super.viewDidLoad()
        
        searchBar.delegate = self
        
        searchBar.placeholder = "Search".localized()
        titleSearch.text = "Search".localized()
        titleDescription.text = "Find what's best for your needs".localized()

		navigationBackgroundImage = navigationController?.navigationBar.backgroundImage(for: .default)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

		tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
		tableView.tableFooterView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 12, height: 100)))

		loadData()
	}

	override func viewWillDisappear(_ animated: Bool) {
        
		navigationController?.navigationBar.setBackgroundImage(navigationBackgroundImage, for: .default)
	}

	// MARK: - Data methods
	func loadData() {
        
        vm.delegate = self
		refreshTableView()
	}

	// MARK: - Refresh methods
	func refreshTableView() {
        
		tableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
extension SearchView: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.search.count
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableView.automaticDimension
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        cell.bindData(index: indexPath.item, data: vm.search[indexPath.row])
    
		return cell
	}
}

// MARK: - UITableViewDelegate
extension SearchView: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsView = DetailsView()
        detailsView.id = vm.search[indexPath.row].id
        detailsView.imagePath = vm.search[indexPath.row].image
        detailsView.titleText = vm.search[indexPath.row].product
        detailsView.descriptionText = vm.search[indexPath.row].description
        
        navigationController?.pushViewController(detailsView, animated: true)
	}
}

// MARK: - UISearchBarDelegate
extension SearchView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        debounceTimer?.invalidate()
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            
            if (searchText.count != 0) {
                
                self.showSpinner()
                self.vm.updateSearch(keyword: searchText)
            }
            
        }
    }
}

extension SearchView: SearchViewModelProtocol {
    
    func didUpdateSearch() {
        
        loadData()
        self.removeSpinner()
    }
}
