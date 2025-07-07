//
//  Untitled.swift
//  NetworkCall
//
//  Created by narendra kumar s on 04/07/25.
//

import Foundation

struct UserDeals: Codable {
    let createdAt: String
    let name: String
    let phoneNumber: Int
    let address: String
    let booking: [String]?
    let imagePhoto: String
    let city: String
    let latitude: Double
    let longitude: Double
    enum CodingKeys : String, CodingKey {
        case createdAt
        case name
        case phoneNumber = "phone_number"
        case address
        case booking
        case imagePhoto = "image_photo"
        case city
        case latitude
        case longitude
    }
}

