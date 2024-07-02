//
//  PlaylistHeaderCell.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 24/06/24.
//

import SwiftUI

struct PlaylistHeaderCell: View {
    
    var title: String = "Some Long Text For Title Goes Here"
    var subtitle: String = "Some subtitle goes here"
    var imageName: String = Constants.randomImage
    var height: CGFloat = 300
    let shadowColor: Color = .spotifyBlack.opacity(0.8)
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageName)
            }
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundColor(.spotifyWhite)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [shadowColor.opacity(0), shadowColor],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .asStretchyHeader(startingHeight: height)
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            PlaylistHeaderCell()
        }
        .ignoresSafeArea()
    }
}
