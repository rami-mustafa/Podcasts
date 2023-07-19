//
//  FavoritePodcastCell.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 18.07.23.
//

 
import UIKit


class FavoritePodcastCell : UICollectionViewCell{
    
    // MARK: - Properties

    let imageView = UIImageView(image: UIImage(named: "rami")!)
    let nameLabel = UILabel()
    let artistNameLabel = UILabel()
    
    
    
    override init(frame: CGRect) {
          super.init(frame: frame)
           setup()
           layout()
        
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}


extension FavoritePodcastCell{

   private func setup(){
       backgroundColor = .green
   }
    
    private func layout(){
        
    }
}









