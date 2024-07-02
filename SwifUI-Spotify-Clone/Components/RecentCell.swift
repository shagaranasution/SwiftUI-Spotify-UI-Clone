//
//  RecentCell.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 20/06/24.
//

import SwiftUI

struct RecentCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some Random Title Goes Here"
    
    var body: some View {
        HStack(spacing: 16) {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()

        VStack {
            HStack {
                RecentCell()
                RecentCell()
            }
            
            HStack {
                RecentCell()
                RecentCell()
            }
        }
    }
}
