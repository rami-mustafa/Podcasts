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
        
        nameLabel.text = "Podcast name"
        artistNameLabel.text = "Artist Name"
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews: [imageView,nameLabel,artistNameLabel])
        stackView.axis = .vertical
//        enables auto layout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
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









