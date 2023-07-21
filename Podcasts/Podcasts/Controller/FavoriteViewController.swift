//
//  FavoriteViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.

import UIKit
private let cellId = "cellId"
class FavoriteViewController: UICollectionViewController {
    
    
    // MARK: - Properties
       private var resultCoreDataItems: [PodcastCoreData] = []{
           didSet{ collectionView.reloadData() }
       }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let window = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let mainTabController = window.keyWindow?.rootViewController as! MainTabBarController
        mainTabController.viewControllers?[0].tabBarItem.badgeValue = nil
        fetchData()
    }
    
}

// MARK: - Helpers
extension FavoriteViewController{
    
    private func fetchData(){
        let fetchRequest = PodcastCoreData.fetchRequest()
        CoreDataController.fetchCoreData(fetchRequest: fetchRequest) { result in
            self.resultCoreDataItems = result
        }
    }
    private func setup(){
        
        collectionView.backgroundColor = .white
        
        collectionView.register(FavoritePodcastCell.self, forCellWithReuseIdentifier: cellId)
        
    }
}
// MARK: - UICollectionViewDataSource
extension FavoriteViewController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resultCoreDataItems.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FavoritePodcastCell
        cell.podcastCoreData = self.resultCoreDataItems[indexPath.item]
        return cell
    }
}
// MARK: - UICollectionViewDelegate
extension FavoriteViewController{
   override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let podcastCoreData = self.resultCoreDataItems[indexPath.item]
       let podcast = Podcast(trackName: podcastCoreData.trackName, artistName: podcastCoreData.artistName!,artworkUrl600: podcastCoreData.artworkUrl600,feedUrl: podcastCoreData.feedUrl)
       let controller = EpisodesController(podcast: podcast)
       self.navigationController?.pushViewController(controller, animated: true)
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


