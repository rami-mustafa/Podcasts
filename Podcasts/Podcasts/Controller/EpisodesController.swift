//
//  EpisodeController.swift
//  Podcasts
//
//  Cated by Ghaiath Alhereh on 14.07.23.
//

import UIKit
private let reuseIdentifier = "EpisodeCell"

class EpisodesController: UITableViewController {
   
    var episodeResult: [Episode] = []{
        didSet{
            self.tableView.reloadData()
        }
    }

    var podcast: Podcast? {
        didSet {
            navigationItem.title = podcast?.trackName
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationItem.title = "Episodes"
        setup()
        fetchData()
    }
    
    
    
}

// MARK: API Service

extension EpisodesController {
    fileprivate func fetchData() {
        EpisodeServcie.fetchData(urlString: self.podcast?.feedUrl ?? "") { result in
            DispatchQueue.main.async {
                self.episodeResult = result
            }
        }
    }
}

// MARK: - Halpers
extension EpisodesController {
    private func setup(){
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)
        
    }
    
}


// MARK: - UItableViewDataSorce
extension EpisodesController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeResult.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier , for: indexPath) as! EpisodeCell
        cell.episodeResult = self.episodeResult[indexPath.item]
        return cell
        
    }
    
}
// MARK: - UItableViewDelegate
extension EpisodesController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let episode = self.episodeResult[indexPath.item]
        let controller = PlayerViewController(episode: episode)
        self.present(controller, animated: true)
        
    }
}
