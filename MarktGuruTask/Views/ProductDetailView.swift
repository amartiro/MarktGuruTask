//
//  ProductDetailView.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    var favoritesManager: FavoritesManager
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                ScrollView{
                    VStack {
                        Text(product.name)
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                        
                        ImageView(imageURL: product.imageURL)
                            .frame(maxWidth: CGFloat.infinity, maxHeight: proxy.size.width)
                            .padding()
                        
                        Text(product.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding()
                        
                        Button(action: {
                            favoritesManager.toggleFavorite(id: product.id)
                        }) {
                            let isFavorite = favoritesManager.isFavorite(id: product.id)
                            let title = isFavorite ? KeyConstants.Title.unfavorite : KeyConstants.Title.favorite
                            let icon = isFavorite ? KeyConstants.Icon.favorite : KeyConstants.Icon.unfavorite
                            Label(title, systemImage: icon)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(Constants.cornerRadius)
                        }
                        
                        Spacer()
                    }
                }
                .frame(height: proxy.size.height)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    private enum Constants {
        static let cornerRadius = 8.0
    }
}

#Preview {
    ProductDetailView(product: MockNetworkManager.getDummyProduct(), favoritesManager: FavoritesManager())
}
