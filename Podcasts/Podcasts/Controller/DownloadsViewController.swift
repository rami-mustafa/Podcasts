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
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifiew, for: indexPath)
        
        return cell
    }
}
// MARK: - UITableViewDelegate
extension DownloadsViewController{
   override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 134
   }
 
}
