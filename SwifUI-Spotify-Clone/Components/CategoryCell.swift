//
//  CategoryCell.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 20/06/24.
//

import SwiftUI

struct CategoryCell: View {
    
    var title: String = "Music"
    var isSelected: Bool = false
    
    var body: some View {
        Text(title)
            .font(.callout)
            .frame(minWidth: 30)
            .padding(.vertical, 8)
            .padding(.horizontal, 10)
            .themeColors(isSelected: isSelected)
            .clipShape(.capsule)
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VStack {
            CategoryCell(title: "Title 1", isSelected: false)
            CategoryCell(title: "All", isSelected: true)
            CategoryCell(title: "Title 3", isSelected: false)
        }
    }
}
