//
//  NewsDatalTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class NewsDatalTests: XCTestCase {
    
    func test_NewsData_Decoding() throws {
        // Given
        let json = """
            {
                "id": 1,
                "slug": "news-slug",
                "url": "https://example.com/news",
                "title": "News Title",
                "content": "This is the content of the news.",
                "image": "https://example.com/image.jpg",
                "thumbnail": "https://example.com/thumbnail.jpg",
                "status": "published",
                "category": "general",
                "publishedAt": "2024-01-01T00:00:00Z",
                "updatedAt": "2024-01-02T00:00:00Z",
                "userId": 123
            }
            """.data(using: .utf8)!
        
        // When
        let decodedNewsData = try JSONDecoder().decode(NewsData.self, from: json)
        
        // Then
        XCTAssertEqual(decodedNewsData.id, 1)
        XCTAssertEqual(decodedNewsData.slug, "news-slug")
        XCTAssertEqual(decodedNewsData.url, "https://example.com/news")
        XCTAssertEqual(decodedNewsData.title, "News Title")
        XCTAssertEqual(decodedNewsData.content, "This is the content of the news.")
        XCTAssertEqual(decodedNewsData.image, "https://example.com/image.jpg")
        XCTAssertEqual(decodedNewsData.thumbnail, "https://example.com/thumbnail.jpg")
        XCTAssertEqual(decodedNewsData.status, "published")
        XCTAssertEqual(decodedNewsData.category, "general")
        XCTAssertEqual(decodedNewsData.publishedAt, "2024-01-01T00:00:00Z")
        XCTAssertEqual(decodedNewsData.updatedAt, "2024-01-02T00:00:00Z")
        XCTAssertEqual(decodedNewsData.userId, 123)
    }
    
    func test_NewsData_Encoding() throws {
        // Given
        let newsData = NewsData(
            id: 1,
            slug: "news-slug",
            url: "https://example.com/news",
            title: "News Title",
            content: "This is the content of the news.",
            image: "https://example.com/image.jpg",
            thumbnail: "https://example.com/thumbnail.jpg",
            status: "published",
            category: "general",
            publishedAt: "2024-01-01T00:00:00Z",
            updatedAt: "2024-01-02T00:00:00Z",
            userId: 123
        )
        
        // When
        let encodedData = try JSONEncoder().encode(newsData)
        let decodedNewsData = try JSONDecoder().decode(NewsData.self, from: encodedData)
        
        // Then
        XCTAssertEqual(decodedNewsData.id, 1)
        XCTAssertEqual(decodedNewsData.slug, "news-slug")
        XCTAssertEqual(decodedNewsData.url, "https://example.com/news")
        XCTAssertEqual(decodedNewsData.title, "News Title")
        XCTAssertEqual(decodedNewsData.content, "This is the content of the news.")
        XCTAssertEqual(decodedNewsData.image, "https://example.com/image.jpg")
        XCTAssertEqual(decodedNewsData.thumbnail, "https://example.com/thumbnail.jpg")
        XCTAssertEqual(decodedNewsData.status, "published")
        XCTAssertEqual(decodedNewsData.category, "general")
        XCTAssertEqual(decodedNewsData.publishedAt, "2024-01-01T00:00:00Z")
        XCTAssertEqual(decodedNewsData.updatedAt, "2024-01-02T00:00:00Z")
        XCTAssertEqual(decodedNewsData.userId, 123)
    }
    
}
