//
//  MapDetailsViewControllerTests.swift
//  Conexa-ChallengeTests
//
//  Created by Oscar A. Rafael Cabanillas on 12/07/2024.
//

import XCTest
import GoogleMaps
@testable import Conexa_Challenge
final class MapDetailsViewControllerTests: XCTestCase {
    var sut: MapDetailsViewController!
    
    override func setUpWithError() throws {
        sut = MapDetailsViewController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_SetupMap() {
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
        let detailViewModel = MapDetailsViewModel(userInfo: mapDataViewModel)
        let latitude = detailViewModel.userInfo.latDouble
        let longitude = detailViewModel.userInfo.lngDouble
        let street = detailViewModel.userInfo.street
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = street
        
        // When
        sut.detailViewModel = detailViewModel
        
        // Then
        sut.loadViewIfNeeded() // Ensure outlets are connected and setupMap() is called
        
        XCTAssertEqual(sut.fullNameLabel.text, "Doe John")
        XCTAssertEqual(sut.streetLabel.text, "123 Main St")
        XCTAssertEqual(sut.latAndLngLabel.text, "Latitud: 37.7749 - longitude: -122.4194")
        
        XCTAssertTrue(sut.mapView.subviews.contains { $0 is GMSMapView })
        
        // Additional assertions for map view if needed
        if let mapView = sut.mapView.subviews.first as? GMSMapView {
            XCTAssertEqual(mapView.camera.target.latitude, 37.7749)
            XCTAssertEqual(mapView.camera.target.longitude, -122.4194)
            marker.map = mapView
            XCTAssertEqual(marker.title, "123 Main St")
            XCTAssertEqual(marker.position.latitude, 37.7749)
            XCTAssertEqual(marker.position.longitude, -122.4194)
        } else {
            XCTFail("MapView not found or incorrect type")
        }
    }
}
