//
//  SearchBarViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.
//

import UIKit
 
class SearchBarViewController: UIViewController {
    
     // MARK: - Properties
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
        
 }

// MARK: - Helpers
extension SearchBarViewController{
    
    private func fetchData(){
        
    }
    private func setup(){
        view.backgroundColor = .secondarySystemBackground

    }
    // MARK: - UICollectionViewDataSourc
    // MARK: - UICollectionViewDelegate
    // MARK: - UICollectionViewDelegateFlowLayout
    
}
