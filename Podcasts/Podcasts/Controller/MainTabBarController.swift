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


//    MARK: - Helers
extension MainTabBarController{
    
    private func setup(){
        viewControllers = [
        
            createViewController(rootViewController: FavoriteViewController() , title: "Favorites", imageName: "heart.fill"),
            createViewController(rootViewController: DownloadsViewController() , title: "Download", imageName: "square.and.arrow.down.on.square"),
            createViewController(rootViewController: SearchBarViewController() , title: "Search", imageName: "magnifyingglass"),

            
        ]
    }
    
    private func createViewController (rootViewController: UIViewController , title: String , imageName: String) -> UINavigationController {
        
        rootViewController.title = title
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.compactAppearance = appearance
        controller.navigationBar.standardAppearance = appearance
        controller.navigationBar.scrollEdgeAppearance = appearance
        controller.navigationBar.compactScrollEdgeAppearance = appearance
        
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(systemName: imageName)
        
        return controller
    }
    
    
}
