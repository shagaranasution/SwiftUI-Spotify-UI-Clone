//
//  NewReleaseCell.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 20/06/24.
//

import SwiftUI

struct NewReleaseCell: View {
    
    var imageName: String = Constants.randomImage
    var headline: String? = "New release form"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "Single - Title"
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
                
                VStack(alignment: .leading, spacing: 4) {
                    if let headline {
                        Text(headline)
                            .font(.callout)
                            .foregroundStyle(.spotifyLightGray)
                    }
                    
                    if let subheadline {
                        Text(subheadline)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.spotifyWhite)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                ImageLoaderView(urlString: imageName)
                    .frame(minWidth: 140, maxWidth: 140, maxHeight: .infinity)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        if let title {
                            Text(title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.spotifyWhite)
                        }
                        
                        if let subtitle {
                            Text(subtitle)
                                .foregroundStyle(.spotifyLightGray)
                        }
                    }
                    .font(.callout)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "plus.circle")
                            .foregroundStyle(.spotifyLightGray)
                            .font(.title3)
                            .padding(4)
                            .offset(x: -4)
                            .onTapGesture {
                                onAddToPlaylistPressed?()
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(systemName: "play.circle.fill")
                            .foregroundStyle(.spotifyWhite)
                            .font(.title)
                    }
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 16)
            }
            .themeColors(isSelected: false)
            .frame(maxWidth: .infinity, maxHeight: 140)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .onTapGesture {
                onPlayPressed?()
            }
        }
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        NewReleaseCell()
            .padding()
    }
}
