//
//  ProductList.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 19/06/24.
//

import Foundation

struct ProductList: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let title, description: String
    let category: ProductCategory
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let warrantyInformation, shippingInformation: String
    let minimumOrderQuantity: Int
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static let mock: Product = Product(
        id: 1,
        title: "Wireless Headphones",
        description: "High quality wireless headphones with noise cancellation and long battery life.",
        category: .groceries,
        price: 149.99,
        discountPercentage: 10.0,
        rating: 4.5,
        stock: 250,
        tags: ["audio", "wireless", "noise-cancelling"],
        brand: "SoundMagic",
        sku: "SM-WH-2023",
        weight: 300, // in grams
        warrantyInformation: "2-year limited warranty.",
        shippingInformation: "Ships in 1-2 business days.",
        minimumOrderQuantity: 1,
        images: [
            Constants.randomImage
        ],
        thumbnail: Constants.randomImage
    )
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
}

enum ProductCategory: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}
