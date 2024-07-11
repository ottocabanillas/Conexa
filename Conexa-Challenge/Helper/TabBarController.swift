//
//  TabBarController.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import UIKit

// MARK: TabBarController Class
final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
}

private extension TabBarController {
   
    // MARK: - Tab Setup
    func setupTabs() {
        var tabBarItems = [UINavigationController]()
        TabBarItemsEnum.allCases.forEach {
            tabBarItems.append(createNav(with: $0.title , and: $0.icon, vc: $0.vc))
        }
        
        setViewControllers(tabBarItems, animated: true)
        selectedIndex = 0
        tabBar.backgroundColor = .init(white: 0.8, alpha: 0.9)
    }
    
    func createNav(with title: String, and image: String, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = UIImage(systemName: image)
        nav.viewControllers.first?.navigationItem.title = title
        
        return nav
    }
}
