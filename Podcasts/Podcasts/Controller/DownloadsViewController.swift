//
//  DownloadsViewController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.
//

import UIKit
private let reuseIdentifiew = "DownloadCell"
class DownloadsViewController: UITableViewController {
    
    // MARK: - Properties
        private var episodeResult = UserDefaults.downloadEpisodeRead()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.episodeResult = UserDefaults.downloadEpisodeRead()
        tableView.reloadData()
        let window = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let mainTabController = window.keyWindow?.rootViewController as! MainTabBarController
        mainTabController.viewControllers?[2].tabBarItem.badgeValue = nil
    }
}

// MARK: - Helpers
extension DownloadsViewController{
    
    private func setup(){
        view.backgroundColor = .white
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifiew)
    }
    
}

// MARK: - UITableViewDataSource
extension DownloadsViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeResult.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifiew, for: indexPath) as! EpisodeCell
        cell.episodeResult = episodeResult[indexPath.item]
        return cell
    }
}
// MARK: - UITableViewDelegate
extension DownloadsViewController{
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 134
   }
 
}
