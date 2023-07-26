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
    let author: String
    let streamUrl: String
    
    var fileUrl: String?
    var imageUrl: String?
    
    init(feedItem: RSSFeedItem) {
        
        
        self.author = feedItem.iTunes?.iTunesAuthor?.description ?? feedItem.author ?? ""
        self.title = feedItem.title ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href ?? "https://cdn.pixabay.com/photo/2018/09/23/00/09/podcast-3696504_1280.jpg"
        //
        //        self.streamUrl = feedItem.enclosure?.attributes?.url ?? ""
        //        self.title = feedItem.title ?? ""
        //        self.pubDate = feedItem.pubDate ?? Date()
        //        self.description = feedItem.iTunes?.iTunesSubtitle ?? feedItem.description ?? ""
        //        self.author = feedItem.iTunes?.iTunesAuthor ?? ""
        //        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href ?? ""
    }
}
