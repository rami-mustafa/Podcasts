//
//  MainTabBarController.swift
//  Podcasts
//
//  Created by Ghaiath Alhereh on 12.07.23.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }

    
}


//    MARK: - Helers Functions

extension MainTabBarController{
    
    
    
    private func setup(){
        
        
        viewControllers = [
            createViewController(rootViewController: FavoriteViewController() , title: "Favorites", imageName: "heart.fill"),
            createViewController(rootViewController: SearchBarViewController() , title: "Search", imageName: "magnifyingglass"),
            createViewController(rootViewController: DownloadsViewController() , title: "Download", imageName: "square.and.arrow.down.on.square"),
        ]
        tabBar.tintColor = .purple
    }
    
    private func createViewController (rootViewController: UIViewController , title: String , imageName: String) -> UINavigationController {
        
        rootViewController.title = title
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        
        let navcontroller = UINavigationController(rootViewController: rootViewController)
        navcontroller.navigationBar.prefersLargeTitles = true
        navcontroller.navigationBar.compactAppearance = appearance
        navcontroller.navigationBar.standardAppearance = appearance
        navcontroller.navigationBar.scrollEdgeAppearance = appearance
        navcontroller.navigationBar.compactScrollEdgeAppearance = appearance
        
        navcontroller.tabBarItem.title = title
        navcontroller.tabBarItem.image = UIImage(systemName: imageName)
        
        return navcontroller
    }
    
    
}
