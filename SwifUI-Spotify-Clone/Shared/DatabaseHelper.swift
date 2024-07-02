//
//  DatabaseHelper.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 19/06/24.
//

import Foundation

// TODO: Refactor to Singleton(?)

struct DatabaseHelper {
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: Constants.productListGet) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(ProductList.self, from: data)
        
        return result.products
    }
    
    func getUsers() async throws -> [User] {
        guard let url = URL(string: Constants.urerListGet) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(UserList.self, from: data)
        
        return result.users
    }
    
}
