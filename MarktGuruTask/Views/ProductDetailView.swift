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
                        
                        Text("Price: $\(product.price, specifier: Constants.priceSpecifier)")
                            .font(.title2)
                            .foregroundColor(.primary)
                            .padding()
                        
                        Text(product.description)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding()

                        FavoriteButton(action: {
                            favoritesManager.toggleFavorite(id: product.id)
                        }, isFavorite: favoritesManager.isFavorite(id: product.id))

                        Spacer()
                    }
                }
                .frame(height: proxy.size.height)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    private enum Constants {
        static let priceSpecifier = "%.2f"
    }
}

#Preview {
    ProductDetailView(product: DummyProduct.dummy, favoritesManager: FavoritesManager())
}
