//
//  FavoritePodcastCell.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 18.07.23.
//


import UIKit
import Kingfisher


class FavoritePodcastCell : UICollectionViewCell{
    
    // MARK: - Properties
    
    var podcastCoreData: PodcastCoreData?{
        didSet{ configure() }
    }
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        return imageView
    }()
    
    private let podcastNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Podcast Name"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .black
        return label
    }()
    private let podcastArtistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Podcast Artist Name"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private var fullStackView: UIStackView!
    
    //    MARK: - Lifecyle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        stylizeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}


extension FavoritePodcastCell{
    
    private func setupViews(){
        
        fullStackView = UIStackView(arrangedSubviews: [imageView,podcastNameLabel,podcastArtistNameLabel])
        fullStackView.axis = .vertical
        //  enables auto layout
        fullStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func stylizeUI(){
        
        addSubview(fullStackView)
        
        NSLayoutConstraint.activate([
            
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            fullStackView.topAnchor.constraint(equalTo: topAnchor),
            fullStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fullStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            fullStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func configure(){
        guard let podcastCoreData = self.podcastCoreData else { return }
        let viewModel = FavoriteCellViewModel(podcastCoreData: podcastCoreData)
        self.imageView.kf.setImage(with: viewModel.imageUrlPodcast)
        self.podcastNameLabel.text = viewModel.podcastNameLabel
        self.podcastArtistNameLabel.text = viewModel.podcastArtistName
    }
}









