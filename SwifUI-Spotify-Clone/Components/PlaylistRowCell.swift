//
//  PlaylistRowCell.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 25/06/24.
//

import SwiftUI

struct PlaylistRowCell: View {
    
    var title: String = "Some Title Goes Here"
    var subtitle: String = "Some Artist Name"
    var imageName: String = Constants.randomImage
    var height: CGFloat = 60
    var onCellPressed: (() -> Void)? = nil
    var onEllipsisPressed: (() -> Void)? = nil
    
    var body: some View {
        Button {
            onCellPressed?()
        } label: {
            HStack(spacing: 8) {
                ImageLoaderView(urlString: imageName)
                    .frame(width: height)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundStyle(.spotifyWhite)
                    
                    Text(subtitle)
                        .font(.callout)
                        .foregroundStyle(.spotifyLightGray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "ellipsis")
                    .font(.subheadline)
                    .foregroundStyle(.spotifyWhite)
                    .padding(16)
                    .offset(x: 16)
                    .onTapGesture {
                        onEllipsisPressed?()
                    }
            }
            .frame(height: height)
        }
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            PlaylistRowCell()
            PlaylistRowCell()
            PlaylistRowCell()
        }
        .padding(.horizontal, 16)
    }
    
}
