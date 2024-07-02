//
//  PlaylistView.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 24/06/24.
//

import SwiftUI

struct PlaylistView: View {
    
    var product: Product = .mock
    var user: User = .mock
    
    @State private var products: [Product] = []
    @State private var showNavbar: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var router: Router
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView {
                LazyVStack(spacing: 12) {
                    PlaylistHeaderCell(
                        title: product.title,
                        subtitle: product.brand ?? "",
                        imageName: product.images.first ?? Constants.randomImage,
                        height: 250
                    )
                    .readingFrame(coordinateSpace: .global) { frame in
                        showNavbar = frame.maxY < 125
                    }
                    
                    PlaylistDescriptionCell(
                        descriptionText: product.description,
                        username: user.firstName,
                        subheadline: product.title,
                        onAddToPlaylistPressed: nil,
                        onDownloadPressed: nil,
                        onSharePressed: nil,
                        onEllipsisPressed: nil,
                        onShufflePressed: nil,
                        onPlayPressed: nil
                    )
                    .padding(.horizontal, 16)
                
                    ForEach(products) { product in
                        PlaylistRowCell(
                            title: product.title,
                            subtitle: product.brand ?? "",
                            imageName: product.firstImage,
                            height: 56,
                            onCellPressed: {
                                router.navigate(to: .playlistView(product: product))
                            },
                            onEllipsisPressed: nil
                        )
                    }
                    .padding(.horizontal, 16)
                    
                }
            }
            
            ZStack {
                Text(product.title)
                    .font(.headline)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(.spotifyBlack)
                    .offset(y: showNavbar ? 0 : -40)
                    .opacity(showNavbar ? 1 : 0)
                
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .padding(10)
                    .background(showNavbar 
                                ? Color.black.opacity(0.001)
                                : Color.spotifyBlack.opacity(0.7))
                    .clipShape(.circle)
                    .onTapGesture {
                        dismiss()
                    }
                    .padding(.leading, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .foregroundStyle(.spotifyWhite)
            .animation(.smooth(duration: 0.2), value: showNavbar)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            products = try await DatabaseHelper().getProducts()
        } catch {
            
        }
    }
    
}

#Preview {
    NavigationStack {
        PlaylistView()
    }
    .environmentObject(Router.shared)
}
