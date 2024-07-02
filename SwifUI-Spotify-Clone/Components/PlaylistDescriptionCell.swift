//
//  PlaylistDescriptionCell.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 24/06/24.
//

import SwiftUI

struct PlaylistDescriptionCell: View {
    
    var descriptionText: String = Product.mock.description
    var username: String = "Nara"
    var subheadline: String = Product.mock.title
    var onAddToPlaylistPressed: (() -> Void)? = nil
    var onDownloadPressed: (() -> Void)? = nil
    var onSharePressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    var onShufflePressed: (() -> Void)? = nil
    var onPlayPressed: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(descriptionText)
            
            madeForYouSection
            
            Text(subheadline)
            
            actionRowSection
        }
        .font(.callout)
        .foregroundColor(.spotifyLightGray)
        .fontWeight(.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - UI
    
    private var madeForYouSection: some View {
        HStack(spacing: 8) {
            Image(systemName: "applelogo")
                .font(.title3)
                .foregroundStyle(.spotifyGreen)
            
            Text("Made for ")
            +
            Text(username)
                .bold()
                .foregroundStyle(.spotifyWhite)
        }
    }
    
    private var actionRowSection: some View {
        HStack(spacing: 16) {
            HStack(spacing: 0) {
                Image(systemName: "plus.circle")
                    .padding(8)
                    .onTapGesture {
                        onAddToPlaylistPressed?()
                    }
                
                Image(systemName: "arrow.down.circle")
                    .padding(8)
                    .onTapGesture {
                        onDownloadPressed?()
                    }
                
                Image(systemName: "square.and.arrow.up")
                    .padding(8)
                    .onTapGesture {
                        onSharePressed?()
                    }
                
                Image(systemName: "ellipsis")
                    .padding(8)
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
            }
            .offset(x: -8)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 8) {
                Image(systemName: "shuffle")
                    .font(.system(size: 24))
                    .foregroundStyle(.spotifyGreen)
                    .onTapGesture {
                        onShufflePressed?()
                    }
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.spotifyGreen)
                    .onTapGesture {
                        onPlayPressed?()
                    }
            }
        }
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        PlaylistDescriptionCell()
            .padding(16)
    }
}
