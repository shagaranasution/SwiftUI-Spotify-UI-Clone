//
//  ImageTitleRowCell.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 21/06/24.
//

import SwiftUI

struct ImageTitleRowCell: View {
    
    var title: String = "Some Title"
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 100
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .foregroundStyle(.spotifyLightGray)
                .font(.callout)
                .lineLimit(2)
                .padding(.horizontal, 4)
        }
        .frame(width: imageSize)
    }
    
}

#Preview {
    
    ZStack {
        Color.black.ignoresSafeArea()
        
        HStack(spacing: 8) {
            ImageTitleRowCell()
            ImageTitleRowCell()
            ImageTitleRowCell()
        }
    }
    
}
