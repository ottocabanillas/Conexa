//
//  UserData.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 09/07/2024.
//

import Foundation

struct UserData: Codable {
    let id: Int
    let firstname, lastname, email, birthDate: String
    let address: Address
    let phone, website: String
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// https://jsonplaceholder.org/users
