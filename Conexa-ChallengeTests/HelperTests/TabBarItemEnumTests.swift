//
//  TabBarItemEnumTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class TabBarItemEnumTests: XCTestCase {
    
    func test_HomeTab() {
        // Given or Arrange
        let expectedTitle = "Home"
        let expectedIcon = "house"
        // When or Act
        
        // Then or Assert
        XCTAssertEqual(TabBarItemsEnum.home.title, expectedTitle, "El título de Home debe ser 'Home'")
        XCTAssertEqual(TabBarItemsEnum.home.icon, expectedIcon, "El ícono de Home debe ser 'house'")
        XCTAssertTrue(TabBarItemsEnum.home.vc is HomeViewController, "El view controller de Home debe ser HomeViewController")
    }
    
    func test_MapsTab() {
        // Given or Arrange
        let expectedTitle = "Maps"
        let expectedIcon = "mappin.and.ellipse"
        // When or Act
        
        // Then or Assert
        XCTAssertEqual(TabBarItemsEnum.maps.title, expectedTitle, "El título de Maps debe ser 'Maps'")
        XCTAssertEqual(TabBarItemsEnum.maps.icon, expectedIcon, "El ícono de Maps debe ser 'mappin.and.ellipse'")
        XCTAssertTrue(TabBarItemsEnum.maps.vc is MapListViewController, "El view controller de Maps debe ser MapListViewController")
    }
    
    func test_NewsTab() {
        // Given or Arrange
        let expectedTitle = "News"
        let expectedIcon = "newspaper"
        // When or Act
        
        // Then or Assert
        XCTAssertEqual(TabBarItemsEnum.news.title, expectedTitle, "El título de News debe ser 'News'")
        XCTAssertEqual(TabBarItemsEnum.news.icon, expectedIcon, "El ícono de News debe ser 'newspaper'")
        XCTAssertTrue(TabBarItemsEnum.news.vc is NewsListViewController, "El view controller de News debe ser NewsListViewController")
    }
}

