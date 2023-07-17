//
//  PlayerViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 16.07.23.
//

import UIKit
import AVKit
import Kingfisher

class PlayerViewController: UIViewController {
    
    // MARK: - Propeties
    var episode: Episode
    private var mainStackView: UIStackView!
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.compact.down"), for: .normal)
        button.addTarget(self, action: #selector(hanleCloseButton), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()
    private let episodeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.customMode()
        imageView.backgroundColor = .systemPurple
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    private let sliderView: UISlider = {
        let slider = UISlider()
        slider.setThumbImage(UIImage(), for: .normal)
        return slider
    }()
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "00 : 00"
        label.textAlignment = .left
        return label
    }()
    private let endLabel: UILabel = {
        let label = UILabel()
        label.text = "00 : 00"
        label.textAlignment = .right
        return label
    }()
    
    private var timerStackView: UIStackView!
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        return label
    }()
    private let userLabel: UILabel = {
        let label = UILabel()
        label.text = "user"
        label.textAlignment = .center
        return label
    }()
    private var playStackView: UIStackView!
    
    private lazy var goForWardButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "goforward.30"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        //  button.addTarget(self, action: #selector(handleGoForWardButton), for: .touchUpInside)
        return button
    }()
    private lazy var goPlayButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.addTarget(self, action: #selector(handleGoPlayButton), for: .touchUpInside)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    private lazy var goBackWardButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "gobackward.15"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        // button.addTarget(self, action: #selector(handleGoBackWardButton), for: .touchUpInside)
        return button
    }()
    
    private var volumeStackView: UIStackView!
    
    private lazy var volumeSliderView: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.minimumValue = 0
        //           slider.addTarget(self, action: #selector(handleVolumeSliderView), for: .valueChanged)
        return slider
    }()
    private let plusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "speaker.wave.3.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()
    private let minusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "speaker.wave.1.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()
    private let player: AVPlayer = {
        let player = AVPlayer()
        return player
    }()
    
    // MARK: - Lifecycle
    init(episode: Episode) {
        self.episode = episode
        super.init(nibName: nil, bundle: nil)
        style()
        layout()
        startPlayEpisode()
        configureUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - Helpers
extension PlayerViewController {
    
    private func startPlayEpisode() {
        guard let url = URL(string: episode.streamUrl) else {return}
        let playerItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playerItem)
        player.play()
        self.goPlayButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        self.volumeSliderView.value = 40
    }

    
    
    
    private func style(){
        view.backgroundColor = .white
        
        timerStackView = UIStackView(arrangedSubviews: [startLabel,endLabel])
        timerStackView.axis = .horizontal
        
        let fullTimerStackView = UIStackView(arrangedSubviews: [sliderView, timerStackView])
        fullTimerStackView.axis = .vertical
        
        
        playStackView = UIStackView(arrangedSubviews: [UIView() ,goBackWardButton,UIView() ,goPlayButton,UIView(), goForWardButton, UIView() ])
        playStackView.axis = .horizontal
        playStackView.distribution = .fillEqually
        
        volumeStackView = UIStackView(arrangedSubviews: [minusImageView, volumeSliderView, plusImageView])
        volumeStackView.axis = .horizontal
        
        mainStackView = UIStackView(arrangedSubviews: [closeButton,episodeImageView,fullTimerStackView,UIView(),nameLabel,userLabel,UIView(),playStackView,volumeStackView])
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout(){
        
        view.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            episodeImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            sliderView.heightAnchor.constraint(equalToConstant: 40),
            playStackView.heightAnchor.constraint(equalToConstant: 60),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
        ])
    }
    
    private func configureUI(){
        self.episodeImageView.kf.setImage(with: URL(string: episode.imageUrl ?? ""))
           self.nameLabel.text = episode.title
           self.userLabel.text = episode.author
       }
}

//MARK: - Selectors
extension PlayerViewController {

    @objc private func handleGoPlayButton(){
          if player.timeControlStatus == .paused{
              player.play()
              self.goPlayButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
          }else{
              player.pause()
              self.goPlayButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
          }
          
      }
    
    @objc private func hanleCloseButton(){
          player.pause()
          self.dismiss(animated: true)
      }
    
}

