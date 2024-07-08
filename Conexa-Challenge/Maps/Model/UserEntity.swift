//
//  UserEntity.swift
//  Conexa-Challenge
//
//  Created by Oscar A. Rafael Cabanillas on 08/07/2024.
//

import Foundation

// https://jsonplaceholder.org/users


struct UserEntity: Codable {
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

