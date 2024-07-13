//
//  NewsDataViewModelTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
class NewsDataViewModelTests: XCTestCase {
    let mockNewsData = NewsData(id: 1, slug: "news-article", url: "https://example.com", title: "Mock News Title", content: "Mock news content...", image: "mock_image_url", thumbnail: "mock_thumbnail_url", status: "published", category: "Technology", publishedAt: "2024-07-12T10:00:00Z", updatedAt: nil, userId: 1)
    var sut: NewsDataViewModel!
    
    override func setUp() {
        sut = NewsDataViewModel(newsData: mockNewsData)
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testInitialization() {
        // Given or Arrange
        
        // When or Act
        
        // Then or Assert
        XCTAssertEqual(sut.category, "Technology")
        XCTAssertEqual(sut.title, "Mock News Title")
        XCTAssertEqual(sut.contentText, "Mock news content...")
        XCTAssertEqual(sut.publishedAt, "2024-07-12T10:00:00Z")
    }
    
    func testCategoryDefaultValue() {
        // Given or Arrange
        let newsDataWithNilCategory = NewsData(id: 2, slug: "news-article-2", url: "https://example.com", title: "Another News", content: "More news content...", image: nil, thumbnail: nil, status: "published", category: nil, publishedAt: "2024-07-12T11:00:00Z", updatedAt: nil, userId: 2)
        
        // When or Act
        let sutWithNilCategory = NewsDataViewModel(newsData: newsDataWithNilCategory)
        
        // Then or Assert
        XCTAssertEqual(sutWithNilCategory.category, "")
    }
}
