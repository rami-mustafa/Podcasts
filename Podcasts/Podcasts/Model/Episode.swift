//
//  Episode.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 15.07.23.
//

import Foundation
import FeedKit

struct Episode: Codable {
    
    let title: String
    let pubDate: Date
    let description: String
    let imageUrl: String
    let streamUrl: String
    let author: String
    var fileUrl: String?
    
    init(feedItem: RSSFeedItem) {
        
        
        self.author = feedItem.iTunes?.iTunesAuthor?.description ?? feedItem.author ?? ""
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href ?? "https://cdn.pixabay.com/photo/2018/09/23/00/09/podcast-3696504_1280.jpg"
        
    }
}
