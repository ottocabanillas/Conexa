//
//  RequestModelTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class RequestModelTests: XCTestCase {
    
    func test_RequestModel_DefaultValues() {
        // Given
        let requestModel = RequestModel(endpoint: .posts)
        
        // When
        let httpMethod = requestModel.httpMethod
        let endpoint = requestModel.endpoint
        
        // Then
        XCTAssertEqual(httpMethod, .GET, "El método HTTP predeterminado debe ser GET")
        XCTAssertEqual(endpoint, .posts, "El endpoint debe ser /posts")
    }
    
    func test_Endpoints_BaseURL() {
        // Given
        let postsEndpoint = RequestModel.Endpoints.posts
        let usersEndpoint = RequestModel.Endpoints.users
        
        // When
        let postsURL = postsEndpoint.baseURL
        let usersURL = usersEndpoint.baseURL
        
        // Then
        XCTAssertEqual(postsURL, "https://jsonplaceholder.org/posts", "La URL de posts debe ser correcta")
        XCTAssertEqual(usersURL, "https://jsonplaceholder.org/users", "La URL de users debe ser correcta")
    }
    
}
