//
//  TabBarController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import UIKit

// MARK: TabBarController Class
class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
    }
}

private extension TabBarController {
    // MARK: - Tab Setup
    private func setupTabs() {
       
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeViewController())
        let news = self.createNav(with: "News", and: UIImage(systemName: "newspaper"), vc: NewsListViewController())
        let maps = self.createNav(with: "Maps", and: UIImage(systemName: "mappin.and.ellipse"), vc: MapsListViewController())
        
        self.setViewControllers([news, home, maps], animated: true)
        
        self.selectedIndex = 1
        
        self.tabBar.backgroundColor = .init(white: 0.8, alpha: 0.9)
        
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.viewControllers.first?.navigationItem.title = title
    
        return nav
    }
}
