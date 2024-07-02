//
//  HomeView.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 20/06/24.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {
    
    @State private var currentUser: User?
    @State private var selectedCategory: Category?
    @State private var products: [Product] = []
    @State private var productRows: [ProductRow] = []
    
    @EnvironmentObject private var router: Router
    
    let recentColumns: [GridItem] = Array(
        repeating: GridItem(.flexible()),
        count: 2
    )
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            Color.spotifyBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                LazyVStack(spacing: 1, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        VStack(spacing: 16) {
                            recentSection
                            
                            if let product = products.first {
                                newReleaseSection(product: product)
                            }
                            
                            listRows
                        }
                        .padding(.horizontal, 16)
                    } header: {
                        header
                    }
                })
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
            .clipped()
        }
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private var header: some View {
        HStack(spacing: 0) {
            ZStack {
                if let currentUser {
                    ImageLoaderView(urlString: currentUser.image)
                        .background(.spotifyWhite)
                        .clipShape(Circle())
                        .onTapGesture {
                            
                        }
                } else {
                    Circle()
                        .fill(Color.spotifyLightGray)
                }
            }
            .frame(width: 35, height: 35)
            
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(Category.allCases, id: \.self) { category in
                        CategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: category == selectedCategory
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
        .padding(.vertical, 16)
        .padding(.leading, 8)
        .background(Color.spotifyBlack)
    }
    
    private var recentSection: some View {
        LazyVGrid(
            columns: recentColumns,
            alignment: .center,
            spacing: 10,
            content: {
                ForEach(products) { product in
                    Button {
                        router.navigate(to: .playlistView(product: product))
                    } label: {
                        RecentCell(
                            imageName: product.firstImage,
                            title: product.title
                        )
                    }
                }
            }
        )
    }
    
    private func newReleaseSection(product: Product) -> some View {
        NewReleaseCell(
            imageName: product.firstImage,
            headline: product.brand,
            subheadline: product.category.rawValue.capitalized,
            title: product.title,
            subtitle: product.description,
            onAddToPlaylistPressed: nil,
            onPlayPressed: {
                router.navigate(to: .playlistView(product: product))
            }
        )
    }
    
    private var listRows: some View {
        ForEach(productRows) { row in
            VStack(spacing: 8) {
                Text(row.title.capitalized)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.spotifyWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal) {
                    HStack(alignment: .top, spacing: 16) {
                        ForEach(row.products) { product in
                            Button {
                                router.navigate(to: .playlistView(product: product))
                            } label: {
                                ImageTitleRowCell(
                                    title: product.title,
                                    imageName: product.firstImage,
                                    imageSize: 120
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, -16)
            }
        }
    }
    
    // MARK: - Utils
    
    private func getData() async {
        guard currentUser == nil,
              products.count == 0
        else { return }
        
        do {
            currentUser = try await DatabaseHelper().getUsers().first
            let baseProducts = try await DatabaseHelper().getProducts()
            products = Array(baseProducts.prefix(8))
            productRows = Dictionary(grouping: baseProducts) { $0.category }
                .map { ProductRow(title: $0.key.rawValue, products: Array($0.value.prefix(20))) }
        } catch {
            
        }
    }
    
}

#Preview {
    NavigationStack {
        HomeView()
    }
    .environmentObject(Router.shared)
}
