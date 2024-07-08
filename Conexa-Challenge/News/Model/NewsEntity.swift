//
//  NewsEntity.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 08/07/2024.
//

import Foundation

// https://jsonplaceholder.org/posts
// https://jsonplaceholder.org/posts/1

// MARK: - Welcome
struct NewsEntity: Codable {
    let id: Int
    let slug: String
    let url: String
    let title, content: String
    let image, thumbnail: String
    let status, category, publishedAt, updatedAt: String
    let userID: Int

    enum CodingKeys: String, CodingKey {
        case id, slug, url, title, content, image, thumbnail, status, category, publishedAt, updatedAt
        case userID = "userId"
    }
}

