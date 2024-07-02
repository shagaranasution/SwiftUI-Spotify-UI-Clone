//
//  UserList.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 19/06/24.
//

import Foundation

// MARK: - UserList
struct UserList: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
    
    static let mock: User = User(
        id: 1,
        firstName: "John",
        lastName: "Doe",
        age: 28,
        email: "john.doe@example.com",
        phone: "+1234567890",
        username: "johndoe",
        password: "securepassword123",
        image: "https://example.com/images/john_doe.jpg",
        height: 180.0, // in centimeters
        weight: 75.0  // in kilograms
    )
}
