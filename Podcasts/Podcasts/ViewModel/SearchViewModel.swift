//
//  SearchViewModel.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 13.07.23.
//

import Foundation

struct SearchViewModel {
    let podcast: Podcast
    
    init(podcast: Podcast) {
        self.podcast = podcast
    }
    
    var photoImageUrl: URL? {
        return URL(string: podcast.artworkUrl600 ?? "")
    }
    
    var trackCountString : String?{
        return "\(podcast.trackCount ?? 0)"
    }
    
    var trackName:String? {
        return podcast.trackName
    }
    
    var artistName:String? {
        return podcast.artistName
    }
    
    
}
