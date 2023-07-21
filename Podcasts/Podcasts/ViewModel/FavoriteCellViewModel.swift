//
//  FavoriteCellViewModel.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 21.07.23.
//

import Foundation
struct FavoriteCellViewModel {
    var podcastCoreData: PodcastCoreData!
    init(podcastCoreData: PodcastCoreData!) {
        self.podcastCoreData = podcastCoreData
    }
    var imageUrlPodcast: URL?{
        return URL(string: podcastCoreData.artworkUrl600 ?? "" )
    }
    var podcastNameLabel: String?{
        return podcastCoreData.trackName
    }
    var podcastArtistName: String?{
        return podcastCoreData.artistName
    }
}
