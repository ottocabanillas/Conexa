//
//  NewsDetailsViewModelTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
class NewsDetailsViewModelTests: XCTestCase {

    // Mock de NewsDataViewModel para pruebas
    let mockNewsData = NewsData(id: 1, slug: "news-article", url: "https://example.com", title: "Mock News Title", content: "Mock news content...", image: "mock_image_url", thumbnail: "mock_thumbnail_url", status: "published", category: "Technology", publishedAt: "2024-07-12T10:00:00Z", updatedAt: nil, userId: 1)
    
    // SUT: System Under Test
    var sut: NewsDetailsViewModel!

    override func setUp() {
        super.setUp()
        let newsDataViewModel = NewsDataViewModel(newsData: mockNewsData)
        sut = NewsDetailsViewModel(news: newsDataViewModel)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testInitialization() {
        XCTAssertEqual(sut.news.title, "Mock News Title")
        XCTAssertEqual(sut.news.contentText, "Mock news content...")
        XCTAssertEqual(sut.news.category, "Technology")
        XCTAssertEqual(sut.news.publishedAt, "2024-07-12T10:00:00Z")
    }
}
