//
//  MapDataViewModelTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class MapDataViewModelTests: XCTestCase {
        
    func test_Initialization_FromUserData() {
        // Given
        let userData = UserData(
            id: 1,
            firstname: "John",
            lastname: "Doe",
            email: "john.doe@example.com",
            birthDate: "1990-01-01",
            address: Address(
                street: "123 Main St",
                suite: "Apt 4",
                city: "San Francisco",
                zipcode: "94103",
                geo: Geo(lat: "37.7749", lng: "-122.4194")
            ),
            phone: "555-555-5555",
            website: "www.johndoe.com"
        )
        
        // When
        let viewModel = MapDataViewModel(userData: userData)
        
        // Then
        XCTAssertEqual(viewModel.firstname, "John")
        XCTAssertEqual(viewModel.lastname, "Doe")
        XCTAssertEqual(viewModel.street, "123 Main St")
        XCTAssertEqual(viewModel.lat, "37.7749")
        XCTAssertEqual(viewModel.lng, "-122.4194")
    }
    
    func test_FullName() {
        // Given
        let userData = UserData(
            id: 1,
            firstname: "Jane",
            lastname: "Smith",
            email: "jane.smith@example.com",
            birthDate: "1990-01-01",
            address: Address(
                street: "456 Elm St",
                suite: "Apt 2",
                city: "New York",
                zipcode: "10001",
                geo: Geo(lat: "40.7128", lng: "-74.0060")
            ),
            phone: "555-555-5555",
            website: "www.janesmith.com"
        )
        
        // When
        let viewModel = MapDataViewModel(userData: userData)
        
        // Then
        XCTAssertEqual(viewModel.fullName, "Smith Jane")
    }
    
    func test_Coordinates() {
        // Given
        let userData = UserData(
            id: 1,
            firstname: "Alice",
            lastname: "Johnson",
            email: "alice.johnson@example.com",
            birthDate: "1990-01-01",
            address: Address(
                street: "789 Pine St",
                suite: "Apt 3",
                city: "Los Angeles",
                zipcode: "90001",
                geo: Geo(lat: "34.0522", lng: "-118.2437")
            ),
            phone: "555-555-5555",
            website: "www.alicejohnson.com"
        )
        
        // When
        let viewModel = MapDataViewModel(userData: userData)
        
        // Then
        XCTAssertEqual(viewModel.coordinates, "Latitud: 34.0522 - longitude: -118.2437")
    }
    
    func testLatDoubleConversion() {
        // Given
        let userData = UserData(
            id: 1,
            firstname: "Bob",
            lastname: "Brown",
            email: "bob.brown@example.com",
            birthDate: "1990-01-01",
            address: Address(
                street: "101 Oak St",
                suite: "Apt 1",
                city: "Chicago",
                zipcode: "60601",
                geo: Geo(lat: "41.8781", lng: "-87.6298")
            ),
            phone: "555-555-5555",
            website: "www.bobbrown.com"
        )
        
        // When
        let viewModel = MapDataViewModel(userData: userData)
        
        // Then
        XCTAssertEqual(viewModel.latDouble, 41.8781)
    }
    
    func test_LngDouble_Conversion() {
        // Given
        let userData = UserData(
            id: 1,
            firstname: "Eve",
            lastname: "Evans",
            email: "eve.evans@example.com",
            birthDate: "1990-01-01",
            address: Address(
                street: "202 Maple St",
                suite: "Apt 2",
                city: "Seattle",
                zipcode: "98101",
                geo: Geo(lat: "47.6062", lng: "-122.3321")
            ),
            phone: "555-555-5555",
            website: "www.eveevans.com"
        )
        
        // When
        let viewModel = MapDataViewModel(userData: userData)
        
        // Then
        XCTAssertEqual(viewModel.lngDouble, -122.3321)
    }
}
