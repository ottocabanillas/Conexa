//
//  NewsListViewModelTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class NewsListViewModelTests: XCTestCase {
    var sut: NewsListViewModel!
    var providerMock: APIServiceMock!
    
    override func setUpWithError() throws {
        providerMock = APIServiceMock()
        sut = NewsListViewModel(apiService: providerMock)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        providerMock = nil
    }
    
    func testRequestDataSuccess() {
        // Given
        providerMock.newsData = [
            NewsData(id: 1, slug: "news-article-1", url: "https://example.com/news1", title: "News Article 1", content: "Content of news article 1", image: "image1.jpg", thumbnail: "thumb1.jpg", status: "published", category: "general", publishedAt: "2024-07-12T12:00:00Z", updatedAt: "2024-07-12T12:00:00Z", userId: 1)
            // Add more news data as needed for testing different scenarios
        ]
        
        let expectation = XCTestExpectation(description: "Request data")
        
        // When
        sut.onViewModelsUpdated = {
            expectation.fulfill()
        }
        sut.requestData()
        
        // Then
        wait(for: [expectation], timeout: 5) // Adjust timeout as necessary
        XCTAssertEqual(sut.viewModels.count, 1) // Check if viewModels are populated correctly
        XCTAssertEqual(sut.viewModels.first?.title, "News Article 1") // Verify other properties as needed
    }
    
    func testRequestDataFailure() {
        // Given
        providerMock.error = NetworkError.generic // Simulate an error condition
        
        let expectation = XCTestExpectation(description: "Request data")
        
        // When
        sut.onViewModelsUpdated = {
            expectation.fulfill()
        }
        sut.requestData()
        
        // Then
        XCTAssertEqual(sut.viewModels.count, 0) // Ensure viewModels are not updated on failure
    }
}
