//
//  EpisodeCell.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 14.07.23.
//

import UIKit


class EpisodeCell: UITableViewCell {
    //    MARK: - prooerties
    //    MARK: - Lifecyle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Helpers
extension EpisodeCell {
    private func setup() {
        backgroundColor = .brown
    }
}
