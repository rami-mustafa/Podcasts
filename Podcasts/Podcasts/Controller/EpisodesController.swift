//
//  EpisodeController.swift
//  Podcasts
//
//  Cated by Ghaiath Alhereh on 14.07.23.
//

import UIKit



private let appDelegate = UIApplication.shared.delegate as! AppDelegate
private let reuseIdentifier = "EpisodeCell"
private let favoritedPodcastKey = "favoritedPodcastKey"

class EpisodesController: UITableViewController {
    
    private let context = appDelegate.persistentContainer.viewContext
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
    
    private var resultCoreDataItems: [PodcastCoreData] = []{
        didSet{
            let isValue = resultCoreDataItems.contains(where: {$0.feedUrl == podcast?.feedUrl})
            if isValue {
                isFavorite = true
            }else{
                isFavorite = false
            }
        }
    }
    
    private var isFavorite = false {
        didSet{
            setupNavigationBarButtons()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        setupNavigationBarButtons()
        fetchCoreData()
    }
    
    private func setupNavigationBarButtons(){
        
        if isFavorite {
            navigationItem.rightBarButtonItems = [
                UIBarButtonItem(image: UIImage(systemName: "heart.fill")?.withTintColor(.systemPink) , style: .plain, target: self, action: #selector(handleSaveFavorite)),
            ]
        } else {
            navigationItem.rightBarButtonItems = [
                UIBarButtonItem(image: UIImage(systemName: "heart")?.withTintColor(.systemPink) , style: .plain, target: self, action: #selector(handleSaveFavorite)),
            ]
        }
        
    }
    
    private func deleteCoreData(){
        let value = resultCoreDataItems.filter({$0.feedUrl == podcast?.feedUrl})
        context.delete(value.first!)
        self.isFavorite = false
    }
    
    
    private func addCoreData(){
        let model = PodcastCoreData(context: context)
        model.feedUrl = self.podcast?.feedUrl
        model.artworkUrl600 = self.podcast?.artworkUrl600
        model.artistName = self.podcast?.artistName
        model.trackName = self.podcast?.trackName
        appDelegate.saveContext()
        isFavorite = true
    }
    
    private func fetchCoreData(){
        let fetchRequest = PodcastCoreData.fetchRequest()
        do {
            let result = try context.fetch(fetchRequest)
            self.resultCoreDataItems = result
        } catch  {
            
        }
        
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

//MARK: - Selectors

extension EpisodesController {
    
    @objc private func handleSaveFavorite(){
        if isFavorite{
            deleteCoreData()
        }else{
            addCoreData()
        }
    }
    
}


