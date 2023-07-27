//
//  EpisodeController.swift
//  Podcasts
//
//  Cated by Ghaiath Alhereh on 14.07.23.
//

import UIKit



private let reuseIdentifier = "EpisodeCell"
private let favoritedPodcastKey = "favoritedPodcastKey"

class EpisodesController: UITableViewController {
    
    private var podcast: Podcast

    var episodeResult: [Episode] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    
    private var resultCoreDataItems: [PodcastCoreData] = []{
        didSet{
            let isValue = resultCoreDataItems.contains(where: {$0.feedUrl == podcast.feedUrl})
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
    
    init(podcast: Podcast) {
        self.podcast = podcast
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        fetchData()
    }
    
    
    
    
}

// MARK: API Service

extension EpisodesController {
    fileprivate func fetchData() {
        EpisodeService.fetchData(urlString: self.podcast.feedUrl!) { result in
            DispatchQueue.main.async {
                self.episodeResult = result
            }
        }
    }
}

// MARK: - Halpers
extension EpisodesController {
    
    private func setup() {
        navigationItem.title = podcast.trackName
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: reuseIdentifier)
        setupNavigationBarButtons()
        fetchCoreData()
    }
    
    private func setupNavigationBarButtons(){
        
        if isFavorite{
                   let navRightItem = UIBarButtonItem(image: UIImage(systemName: "heart.fill")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(handleSaveFavorite))
                   self.navigationItem.rightBarButtonItem = navRightItem
               }else{
                   let navRightItem = UIBarButtonItem(image: UIImage(systemName: "heart")?.withTintColor(.systemPink, renderingMode: .alwaysOriginal), style: .done, target: self, action: #selector(handleSaveFavorite))
                   self.navigationItem.rightBarButtonItem = navRightItem
               }
        
    }
    
    private func deleteCoreData(){
        CoreDataController.deleteCoreData(array: resultCoreDataItems, podcast: podcast)
        self.isFavorite = false
    }
    
    
    private func addCoreData(){
        let model = PodcastCoreData(context: context)
        CoreDataController.addCoreData(model: model, podcast: self.podcast )
        isFavorite = true
        let window = UIApplication.shared.connectedScenes.first as! UIWindowScene
        let mainTabController = window.keyWindow?.rootViewController as! MainTabBarController
        mainTabController.viewControllers?[0].tabBarItem.badgeValue = "New"
    }
    
    private func fetchCoreData() {
        let fetchRequest = PodcastCoreData.fetchRequest()
        CoreDataController.fetchCoreData(fetchRequest: fetchRequest) { result in
        self.resultCoreDataItems = result
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
           let downloadAction = UIContextualAction(style: .destructive, title: "Download") { action, view, completion in
               UserDefaults.downloadEpisodeWrite(episode: self.episodeResult[indexPath.item])
               EpisodeService.download(episode: self.episodeResult[indexPath.item])
               let window = UIApplication.shared.connectedScenes.first as! UIWindowScene
               let mainTabController = window.keyWindow?.rootViewController as! MainTabBarController
               mainTabController.viewControllers?[2].tabBarItem.badgeValue = "New"
               completion(true)
           }
           
           let configuration = UISwipeActionsConfiguration(actions: [downloadAction])
           return configuration
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


