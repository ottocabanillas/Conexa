//
//  RequestModel.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import Foundation

// MARK: RequestModel Struct
struct RequestModel  {
    var httpMethod: HttpMethod = .GET
    var endpoint: Endpoints
    
    enum HttpMethod: String {
        case GET
    }

    enum Endpoints: String {
        case posts = "/posts"
        case users = "/users"
        
        var baseURL: String {
            return "https://jsonplaceholder.org/".appending(self.rawValue)
        }
    }
}
