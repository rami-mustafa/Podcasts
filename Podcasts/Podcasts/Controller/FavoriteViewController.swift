//
//  FavoriteViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.

import UIKit

class FavoriteViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    fileprivate let cellId = "cellId"
    
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
       
       collectionView.backgroundColor = .white

       collectionView.register(FavoritePodcastCell.self, forCellWithReuseIdentifier: cellId)
 
   }
}
// MARK: - UICollectionViewDataSource
extension FavoriteViewController{
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 5
   }
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoritePodcastCell
       return cell
   }
}
// MARK: - UICollectionViewDelegate
extension FavoriteViewController{
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
   }
}



