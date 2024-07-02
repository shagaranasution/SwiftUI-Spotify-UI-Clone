//
//  Extensions.swift
//  SwifUI-Spotify-Clone
//
//  Created by Shagara F Nasution on 20/06/24.
//

import SwiftUI

extension View {
    
    public func themeColors(isSelected: Bool) -> some View {
        self
            .background(isSelected ? Color.spotifyGreen : Color.spotifyDarkGray)
            .foregroundColor(isSelected ? Color.spotifyBlack : Color.spotifyWhite)
    }
    
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
