//
//  MapListViewModelTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class MapListViewModelTests: XCTestCase {
    var sut: MapListsViewModel!
    var providerMock: APIServiceMock!
    
    override func setUpWithError() throws {
        providerMock = APIServiceMock()
        sut = MapListsViewModel(apiService: providerMock)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        providerMock = nil
    }
    
    func test_RequestData_Success() {
        // Given
        providerMock.userData = [
            UserData(id: 1, firstname: "John", lastname: "Doe", email: "john.doe@example.com", birthDate: "1990-01-01", address: Address(street: "123 Main St", suite: "Apt 4", city: "San Francisco", zipcode: "94103", geo: Geo(lat: "37.7749", lng: "-122.4194")), phone: "555-555-5555", website: "www.johndoe.com")
        ]
        
        let expectation = XCTestExpectation(description: "Request data")
        // When
        sut.onViewModelsUpdated = {
                expectation.fulfill()
            }
        sut.requestData()
        
        // Then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(sut.viewModels.count, 1)
        XCTAssertEqual(sut.viewModels.first?.lastname, "Doe")
    }
    
    func test_RequestData_Failure() {
        // Given
        providerMock.error = NetworkError.generic
        let expectation = XCTestExpectation(description: "Request data")
        // When
        sut.onViewModelsUpdated = {
                expectation.fulfill()
            }
        sut.requestData()
        
        // Then
        XCTAssertEqual(sut.viewModels.count, 0)
    }
    
}
