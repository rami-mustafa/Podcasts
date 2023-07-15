//
//  EpisodeController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 14.07.23.
//

import UIKit
private let reuseIdentifier = "EpisodeCell"

class EpisodesController: UITableViewController {
    
    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = "Episodes"
        setup()
    }
    
    
    
}

// MARK: - Halpers
extension EpisodesController {
    private func setup(){
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        
    }
    
    
    
}
// MARK: - UItableView
extension EpisodesController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier , for: indexPath) as! EpisodeCell
        cell.backgroundColor = .blue
        return cell
        
    }
    
}
