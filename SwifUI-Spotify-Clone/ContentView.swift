//
//  ContentView.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 19/06/24.
//

import SwiftUI
import SwiftfulUI

/*
 
- Core
- Components
 - SpotifyHomeView
- Models
 - Enum Category: all music podcasts audiobooks
 */

struct ContentView: View {
    
    @ObservedObject private var router: Router = Router.shared
    
    var body: some View {
        NavigationStack(path: $router.navPath) {
            HomeView()
                .navigationDestination(for: Router.Destination.self) { destination in
                    switch destination {
                    case .playlistView(let product):
                        PlaylistView(product: product)
                    }
                }
        }
        .environmentObject(router)
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
    .environmentObject(Router.shared)
}
