//
//  DownloadsViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.
//

 import UIKit

class DownloadsViewController: UIViewController {
    
     // MARK: - Properties
     // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
        
 }

// MARK: - Helpers
extension DownloadsViewController{
    
    private func fetchData(){
        
    }
    private func setup(){
        view.backgroundColor = .green

    }
    // MARK: - UICollectionViewDataSourc
    // MARK: - UICollectionViewDelegate
    // MARK: - UICollectionViewDelegateFlowLayout
    
} 
