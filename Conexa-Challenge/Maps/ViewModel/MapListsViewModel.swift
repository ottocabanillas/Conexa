//
//  MapListsViewModel.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 11/07/2024.
//

import Foundation

final class MapListsViewModel {
    
    // MARK: - Variables
    private let apiService = APIService()
    private(set) var viewModels: [MapDataViewModel] = [] {
        didSet {
            self.onViewModelsUpdated?()
        }
    }
    
    var onViewModelsUpdated: (() -> Void)?
    
    // MARK: - Methods
    func requestData() {
        Task(priority: .utility) {
            let usersData = try await apiService.getUserData()
            self.viewModels = usersData.map {
                MapDataViewModel(userData: $0)
            }
            self.viewModels = viewModels.sorted { $0.lastname < $1.lastname }
        }
        
    }
}
