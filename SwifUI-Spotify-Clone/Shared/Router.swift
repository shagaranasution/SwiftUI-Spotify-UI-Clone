//
//  Router.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 26/06/24.
//

import SwiftUI

final class Router: ObservableObject {
    
    public enum Destination: Codable, Hashable {
        case playlistView(product: Product)
    }
    
    @Published var navPath: NavigationPath = NavigationPath()
    
    static let shared: Router = Router()
    
    private init() {}
    
    func navigate(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
    
}
