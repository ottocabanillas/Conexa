//
//  MapDataViewModel.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 11/07/2024.
//

import Foundation

// MARK: MapDataViewnModel Class
final class MapDataViewModel {
    
    // MARK: - Variables
    private(set) var firstname: String
    private(set) var lastname: String
    private(set) var street: String
    private(set) var lat: String
    private(set) var lng: String
    
    var fullName: String {
        return  lastname + " " + firstname
    }
    var coordinates: String {
        return ("Latitud: \(lat) - longitude: \(lng)")
    }
    var latDouble: Double {
        return Double(lat) ?? 0
    }
    var lngDouble: Double {
        return Double(lng) ?? 0
    }
    
    init(userData: UserData) {
        self.firstname = userData.firstname
        self.lastname = userData.lastname
        self.street = userData.address.street
        self.lat = userData.address.geo.lat
        self.lng = userData.address.geo.lng
    }
}


