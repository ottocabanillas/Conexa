//
//  MapDetailsViewModelTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class MapDetailsViewModelTests: XCTestCase {

    func test_Initialization() {
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
            
            let mapDataViewModel = MapDataViewModel(userData: userData)
            
            // When
            let viewModel = MapDetailsViewModel(userInfo: mapDataViewModel)
            
            // Then
            XCTAssertEqual(viewModel.userInfo.firstname, "John")
            XCTAssertEqual(viewModel.userInfo.lastname, "Doe")
            XCTAssertEqual(viewModel.userInfo.street, "123 Main St")
            XCTAssertEqual(viewModel.userInfo.lat, "37.7749")
            XCTAssertEqual(viewModel.userInfo.lng, "-122.4194")
        }
}
