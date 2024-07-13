//
//  MapListViewControllerTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
class MapListViewControllerTests: XCTestCase {
    var sut: MapListViewController!
    var mockViewModel: MapListsViewModelProtocol!
    var window: UIWindow!

    override func setUpWithError() throws {
        mockViewModel = MockMapListsViewModel()
        sut = MapListViewController(viewModel: mockViewModel)
        window = UIWindow()
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    override func tearDownWithError() throws {
        window = nil
        sut = nil
        mockViewModel = nil
    }

    func test_TableView_IsNotNil_AfterViewDidLoad() {
        // Given or Arrange
        
        // When or Act
        
        // Then or Assert
        XCTAssertNotNil(sut.tableViewUser)
    }

    func test_TableView_RegistersCell() {
        // Given or Arrange
        let registeredCell = sut.tableViewUser.dequeueReusableCell(withIdentifier: "userData_cell")
        
        // When or Act
        
        // Then or Assert
        XCTAssertNotNil(registeredCell)
    }

    func test_TableView_CellForRow() {
        // Given or Arrange
        let indexPath = IndexPath(row: 0, section: 0)
        // When or Act
        let cell = sut.tableView(sut.tableViewUser, cellForRowAt: indexPath)
        // Then or Assert
        XCTAssertEqual(cell.textLabel?.text, mockViewModel.viewModels[indexPath.row].fullName)       
    }
}

// Mock del ViewModel que implementa el protocolo
class MockMapListsViewModel: MapListsViewModelProtocol {

    // Propiedades del mock
    var viewModels: [MapDataViewModel] = []
    var onViewModelsUpdated: (() -> Void)?

    // Simulación de la función requestData
    func requestData() {
        // Simulación de datos de prueba
        let mockData: [UserData] = [
            UserData(id: 1, firstname: "John", lastname: "Doe", email: "john.doe@example.com", birthDate: "1990-01-01", address: Address(street: "123 Street", suite: "Apt 1", city: "City", zipcode: "12345", geo: Geo(lat: "40.7128", lng: "-74.0060")), phone: "123-456-7890", website: "example.com"),
            UserData(id: 2, firstname: "Jane", lastname: "Smith", email: "jane.smith@example.com", birthDate: "1995-02-15", address: Address(street: "456 Avenue", suite: "Apt 2", city: "Town", zipcode: "54321", geo: Geo(lat: "34.0522", lng: "-118.2437")), phone: "987-654-3210", website: "example.org")
        ]
        
        // Mapeo de UserData a MapDataViewModel
        viewModels = mockData.map { MapDataViewModel(userData: $0) }
        
        // Notificar que los viewModels se han actualizado
        onViewModelsUpdated?()
    }
}
