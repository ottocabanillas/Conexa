//
//  APIServiceMock.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import Foundation
// MARK: APIServiceMock
class APIServiceMock: APIServiceProtocol {
    // MARK: - Variables
    var userData: [UserData] = []
    var error: Error?
    var newsData: [NewsData] = []
    
    // MARK: - Methods
    func getUserData() async throws -> [UserData] {
        if let error = error {
            throw error
        }
        return userData
    }
    
    func getNewsData() async throws -> [NewsData] {
        if let error = error {
            throw error
        }
        return newsData
    }
}
