//
//  Search.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.
//

import Foundation

struct Search: Decodable {
    let resultCount: Int
    let results: [Podcast]
}

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String
    var trackCount: Int?
    var artworkUrl600: String?
    var feedUrl: String?
}
