//
//  NewsArrayViewModel.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import Foundation

// MARK: NewsArrayViewModel Class
final class NewsArrayViewModel {
    
    // MARK: - Variables
    private(set) var category: String
    private(set) var title: String
    private(set) var contentText: String
    private(set) var publishedAt: String
    
    init(newsData: NewsData) {
        self.category = newsData.category ?? ""
        self.title = newsData.title
        self.publishedAt = newsData.publishedAt ?? ""
        self.contentText = newsData.content
    }
}
