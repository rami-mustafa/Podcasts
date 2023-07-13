//
//  SearchBarCell.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.
//

import UIKit

class SearchBarCell: UITableViewCell {
    // MARK: - Properties
    
    private let imagePhoneView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPurple
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let trackName: UILabel = {
        let label = UILabel()
        label.text = "trackName"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let artistName: UILabel = {
        let label = UILabel()
        label.text = "artistName"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let trackCount: UILabel = {
        let label = UILabel()
        label.text = "trackCount"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .lightGray
        return label
    }()
    
    private var stackView: UIStackView!
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - Helpers

extension SearchBarCell {
    
    private func setup(){

        imagePhoneView.translatesAutoresizingMaskIntoConstraints = false
        imagePhoneView.layer.cornerRadius = 12
        
        stackView = UIStackView(arrangedSubviews: [trackName, artistName , trackCount])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout(){
        
        addSubview(imagePhoneView)
        addSubview(stackView)

        
        NSLayoutConstraint.activate([
            imagePhoneView.heightAnchor.constraint(equalToConstant: 80),
            imagePhoneView.widthAnchor.constraint(equalToConstant: 80),
            imagePhoneView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imagePhoneView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            
            stackView.centerYAnchor.constraint(equalTo: imagePhoneView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: imagePhoneView.trailingAnchor , constant: 4),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
     }
}
