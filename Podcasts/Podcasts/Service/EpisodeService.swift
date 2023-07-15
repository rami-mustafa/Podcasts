//
//  EpisodeServie.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 14.07.23.
//

import Foundation
import FeedKit

struct EpisodeServcie {
    
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
        
}
    

