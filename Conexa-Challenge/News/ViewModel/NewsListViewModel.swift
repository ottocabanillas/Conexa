//
//  NewsListViewModel.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 10/07/2024.
//

import Foundation

// MARK: NewsDataListViewModel Class
final class NewsListViewModel {
    
    // MARK: - Variables
    private let apiService = APIService()
    private(set) var viewModels: [NewsArrayViewModel] = [] {
        didSet {
            self.onViewModelsUpdated?()
        }
    }
    private(set) var filteredNews: [NewsArrayViewModel] = []
    
    var filterType: FilterType = .title {
        didSet {
            filterNews()
        }
    }
    var searchText: String = "" {
        didSet {
            filterNews()
        }
    }
    var onViewModelsUpdated: (() -> Void)?
    
    // MARK: - Methods
    func requestData() {
        Task(priority: .utility) {
            let newsData = try await apiService.getNewsData()
            self.viewModels = newsData.map {
                NewsArrayViewModel(newsData: $0)
            }
        }
    }
    
    func filterNews() {
        switch filterType {
        case .title:
            filteredNews = viewModels.filter { $0.title.contains(searchText) }
        case .contentText:
            filteredNews = viewModels.filter { $0.contentText.contains(searchText) }
        }
    }
}
