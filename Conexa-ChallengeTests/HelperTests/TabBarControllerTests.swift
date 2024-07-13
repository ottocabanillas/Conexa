//
//  TabBarControllerTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge

final class TabBarControllerTests: XCTestCase {
    // System Under Test
    var sut: TabBarController!
    
    override func setUpWithError() throws {
        sut = TabBarController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_TabBar_HasCorrectNumberOfViewControllers() {
        // Given or Arrange
        sut.viewDidLoad()
        
        // When or Act
        let expectedNumberOfTabs = TabBarItemsEnum.allCases.count
        
        // Then or Assert
        XCTAssertEqual(sut.viewControllers?.count, expectedNumberOfTabs, "El número de tabs debe ser igual al número de casos en TabBarItemsEnum")
    }
    
    func test_TabBar_HasCorrectTitles() {
        // Given or Arrange
        sut.viewDidLoad()
        
        // When or Act
        TabBarItemsEnum.allCases.enumerated().forEach { index, item in
            let navController = sut.viewControllers?[index] as? UINavigationController
            let tabBarItem = navController?.tabBarItem
            // Then or Assert
            XCTAssertEqual(tabBarItem?.title, item.title, "El título de la pestaña debe ser \(item.title)")
        }
    }
    
    func test_TabBar_HasCorrectImages() {
        // Given or Arrange
        sut.viewDidLoad()
        
        // When or Act
        TabBarItemsEnum.allCases.enumerated().forEach { index, item in
            let navController = sut.viewControllers?[index] as? UINavigationController
            let tabBarItem = navController?.tabBarItem
            // Then or Assert
            XCTAssertEqual(tabBarItem?.image, UIImage(systemName: item.icon), "La imagen de la pestaña debe ser \(item.icon)")
        }
    }
}
