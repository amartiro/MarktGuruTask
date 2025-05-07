//
//  FavoriteButton.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 07.05.25.
//

import SwiftUI

struct FavoriteButton: View {
    
    var action: () -> Void
    var isFavorite: Bool
    
    var body: some View {
        Button(action: action) {
            let title = isFavorite ? KeyConstants.Title.unfavorite : KeyConstants.Title.favorite
            let icon = isFavorite ? KeyConstants.Icon.favorite : KeyConstants.Icon.unfavorite
            Label(title, systemImage: icon)
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(Constants.cornerRadius)
        }
    }
    
    private enum Constants {
        static let cornerRadius = 8.0
    }
}

#Preview {
    FavoriteButton(action: { }, isFavorite: true)
    FavoriteButton(action: { }, isFavorite: false)
}
