//
//  Cm.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 15.07.23.
//

import UIKit

extension UIImageView{
    func customMode(){
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
