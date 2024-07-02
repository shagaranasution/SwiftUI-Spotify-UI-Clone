//
//  ProductRow.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 21/06/24.
//

import Foundation

struct ProductRow: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let products: [Product]
}
