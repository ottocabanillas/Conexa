//
//  MapListsViewModel.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 11/07/2024.
//

import Foundation

protocol MapListsViewModelProtocol {
    var viewModels: [MapDataViewModel] { get }
    var onViewModelsUpdated: (() -> Void)? { get set }
    func requestData()
}

final class MapListsViewModel: MapListsViewModelProtocol {
    
    // MARK: - Variables
    private let apiService: APIServiceProtocol
    private(set) var viewModels: [MapDataViewModel] = [] {
        didSet {
            self.onViewModelsUpdated?()
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
                let usersData = try await apiService.getUserData()
                self.viewModels = usersData.map {
                    MapDataViewModel(userData: $0)
                }
                self.viewModels = self.viewModels.sorted { $0.lastname < $1.lastname }
            } catch {
                // Handle error
                print("Error fetching user data: \(error)")
                // You might want to handle errors in a real app
            }
        }
    }
}
