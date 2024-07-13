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
    private let apiService: APIServiceProtocol
    private(set) var viewModels: [NewsDataViewModel] = [] {
        didSet {
            self.onViewModelsUpdated?()
        }
    }
    private(set) var filteredNews: [NewsDataViewModel] = []
    
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
    
    // MARK: - Initialization
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }
    
    // MARK: - Methods
    func requestData() {
        Task(priority: .utility) {
            do {
                let newsData = try await apiService.getNewsData()
                self.viewModels = newsData.map {
                    NewsDataViewModel(newsData: $0)
                }
            } catch {
                // Handle error
                print("Error fetching news data: \(error)")
                // You might want to handle errors in a real app
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
