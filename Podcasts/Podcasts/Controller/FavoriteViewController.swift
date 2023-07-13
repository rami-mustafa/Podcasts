//
//  FavoriteViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.

import UIKit
 
class FavoriteViewController: UIViewController {
    
     // MARK: - Properties
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
        
 }

// MARK: - Helpers
extension FavoriteViewController{
    
    private func fetchData(){
        
    }
    private func setup(){
        view.backgroundColor = .darkGray
    }
    // MARK: - UICollectionViewDataSourc
    // MARK: - UICollectionViewDelegate
    // MARK: - UICollectionViewDelegateFlowLayout
    
}
