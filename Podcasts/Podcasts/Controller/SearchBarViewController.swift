//
//  SearchBarViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.
//

import UIKit
import Alamofire
private let reuseIdentifier = "SearchCell"

class SearchBarViewController: UITableViewController {
    
     // MARK: - Properties
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setup()
    }
        
 }

// MARK: - Helpers
extension SearchBarViewController{
    
    private func style(){
        
        tableView.register(SearchBarCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 130
        
        let searchBarController = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = searchBarController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        searchBarController.searchBar.delegate = self
        
    }
    private func setup(){
 
    }
    
}

// MARK: - UICollectionViewDataSourc
extension SearchBarViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchBarCell
 
        return cell
    }
    
}


// MARK: - UISearchBarDelegate
extension  SearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        AF.request("https://itunes.apple.com/search?term=jack+johnson&limit=25.").responseData { response in
            print(String(data: response.data!, encoding: .utf8))
        }
       
        
    }
}



// MARK: - UICollectionViewDelegateFlowLayout
