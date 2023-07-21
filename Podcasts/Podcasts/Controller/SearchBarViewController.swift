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
    
    var searchResult: [Podcast] = []{
           didSet{ tableView.reloadData() }
       }
    
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
        self.definesPresentationContext = true
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
        return searchResult.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SearchBarCell
        cell.result = self.searchResult[indexPath.row]
        return cell
    }
    
    
    
}

// MARK: - UITableView
extension SearchBarViewController {
   override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let label = UILabel()
       label.text = "Start Searching All Podcasts.."
       label.textAlignment = .center
       label.font = UIFont.preferredFont(forTextStyle: .title1)
       label.textColor = .systemPurple
       return label
   }
    
   override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//       ternary operator
       return self.searchResult.count == 0 ? 80 : 0
   }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let podcast = self.searchResult[indexPath.row]
        let episodesController = EpisodesController(podcast: podcast)
        navigationController?.pushViewController(episodesController, animated: true)
        
        print(indexPath.row)
    }
    
    
}



// MARK: - UISearchBarDelegate
extension  SearchBarViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        SearchService.fetchData(searchText: searchText) { result in
            self.searchResult = result
            
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
          self.searchResult = []
      }
}



