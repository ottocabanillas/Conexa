//
//  UserDataTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
@testable import Conexa_Challenge
final class UserDataTests: XCTestCase {
    
    func test_UserData_Initialization() {
        // Given or Arrange
        let geo = Geo(lat: "37.7749", lng: "-122.4194")
        let address = Address(street: "123 Main St", suite: "Apt 4", city: "San Francisco", zipcode: "94103", geo: geo)
        let userData = UserData(id: 1, firstname: "John", lastname: "Doe", email: "john.doe@example.com", birthDate: "1990-01-01", address: address, phone: "555-555-5555", website: "www.johndoe.com")
        // When or Act
        
        // Then or Assert
        XCTAssertEqual(userData.id, 1)
        XCTAssertEqual(userData.firstname, "John")
        XCTAssertEqual(userData.lastname, "Doe")
        XCTAssertEqual(userData.email, "john.doe@example.com")
        XCTAssertEqual(userData.birthDate, "1990-01-01")
        XCTAssertEqual(userData.address.street, "123 Main St")
        XCTAssertEqual(userData.address.suite, "Apt 4")
        XCTAssertEqual(userData.address.city, "San Francisco")
        XCTAssertEqual(userData.address.zipcode, "94103")
        XCTAssertEqual(userData.address.geo.lat, "37.7749")
        XCTAssertEqual(userData.address.geo.lng, "-122.4194")
        XCTAssertEqual(userData.phone, "555-555-5555")
        XCTAssertEqual(userData.website, "www.johndoe.com")
    }
    
    func testUserDataJSONEncodingDecoding() {
        // Given or Arrange
        let geo = Geo(lat: "37.7749", lng: "-122.4194")
        let address = Address(street: "123 Main St", suite: "Apt 4", city: "San Francisco", zipcode: "94103", geo: geo)
        let userData = UserData(id: 1, firstname: "John", lastname: "Doe", email: "john.doe@example.com", birthDate: "1990-01-01", address: address, phone: "555-555-5555", website: "www.johndoe.com")
        
        // When or Act
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(userData)
            
            let decoder = JSONDecoder()
            let decodedUserData = try decoder.decode(UserData.self, from: data)
            
            // Then or Assert
            XCTAssertEqual(decodedUserData.id, userData.id)
            XCTAssertEqual(decodedUserData.firstname, userData.firstname)
            XCTAssertEqual(decodedUserData.lastname, userData.lastname)
            XCTAssertEqual(decodedUserData.email, userData.email)
            XCTAssertEqual(decodedUserData.birthDate, userData.birthDate)
            XCTAssertEqual(decodedUserData.address.street, userData.address.street)
            XCTAssertEqual(decodedUserData.address.suite, userData.address.suite)
            XCTAssertEqual(decodedUserData.address.city, userData.address.city)
            XCTAssertEqual(decodedUserData.address.zipcode, userData.address.zipcode)
            XCTAssertEqual(decodedUserData.address.geo.lat, userData.address.geo.lat)
            XCTAssertEqual(decodedUserData.address.geo.lng, userData.address.geo.lng)
            XCTAssertEqual(decodedUserData.phone, userData.phone)
            XCTAssertEqual(decodedUserData.website, userData.website)
        } catch {
            XCTFail("Encoding or decoding failed: \(error)")
        }
    }
    
}
