//
//  FavoriteViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.

import UIKit
private let cellId = "cellId"
class FavoriteViewController: UICollectionViewController {
    
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


// MARK: - UICollectionViewDelegateFlowLayout
extension FavoriteViewController: UICollectionViewDelegateFlowLayout{
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let width = (view.frame.width - 3 * 16) / 2
       return .init(width: width, height: width + 46)
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 16
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 16
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return .init(top: 16, left: 16, bottom: 16, right: 16)
   }
}


