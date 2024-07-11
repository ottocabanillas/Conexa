//
//  TabBarItemEnum.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import UIKit

// MARK: TabBarItemsEnum Enum
enum TabBarItemsEnum: CaseIterable {
    case home
    case maps
    case news
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .maps:
            return "Maps"
        case .news:
            return "News"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .maps:
            return "mappin.and.ellipse"
        case .news:
            return "newspaper"
        }
    }
    
    var vc: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .maps:
            return MapsListViewController()
        case .news:
            return NewsListViewController()
        }
    }
}
