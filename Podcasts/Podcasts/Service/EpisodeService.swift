//
//  EpisodeServie.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 14.07.23.
//

import Foundation
import FeedKit
import Alamofire


struct EpisodeService {
    
    static func fetchData(urlString: String , completion: @escaping([Episode]) -> Void ){
        var episodeResult: [Episode] = []
        
        let feedKit = FeedParser(URL: URL(string: urlString )!)
        feedKit.parseAsync { result in
            switch result {
                
            case .success(let feed):
                switch feed{
                    
                case .rss(let feedResult):
                    feedResult.items?.forEach({ value in
                 let episodeCell = Episode(feedItem: value)
                        episodeResult.append(episodeCell)
                        completion(episodeResult)
                    })
                case .json(_):
                    break
                case .atom(_):
                    break
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    static func download(episode: Episode){
         let downloadrequest = DownloadRequest.suggestedDownloadDestination()
         AF.download(episode.streamUrl, to: downloadrequest).downloadProgress { progress in
             let progressValue = progress.fractionCompleted
             NotificationCenter.default.post(name: .downloadNotificationName, object: nil,userInfo: ["title": episode.title, "progress": progressValue])

         }.response { response in
             
             var downloadEpisodeResponse = UserDefaults.downloadEpisodeRead()
             let index = downloadEpisodeResponse.firstIndex(where: {$0.author == episode.author && $0.streamUrl == episode.streamUrl})
             downloadEpisodeResponse[index!].fileUrl = response.fileURL?.absoluteString
             do{
                 let data = try JSONEncoder().encode(downloadEpisodeResponse)
                 UserDefaults.standard.set(data, forKey: UserDefaults.downloadKey)
             }catch{
                 
             }
             
             
         }
         
         
     }
 }
