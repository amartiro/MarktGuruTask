//
//  ProductListCellView.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 06.05.25.
//

import SwiftUI

struct ProductListCellView: View {
    
    let product: Product
    let isFavorite: Bool
    
    var body: some View {
        HStack {
            ImageView(imageURL: product.imageURL)
                .frame(width: Constants.imageSize, height:  Constants.imageSize)
            
            VStack(alignment: .leading) {
                Text(product.name).bold()
                Text("$\(product.price, specifier: Constants.priceSpecifier)")
                    .foregroundColor(.secondary)
            }
            Spacer()
            Image(systemName: isFavorite ? KeyConstants.Icon.favorite : KeyConstants.Icon.unfavorite)
                .foregroundColor(.red)
        }
    }
    
    private enum Constants {
        static let imageSize = 70.0
        static let priceSpecifier = "%.2f"
    }
}

#Preview {
    ProductListCellView(product: MockNetworkManager.getDummyProduct(), isFavorite: true)
}
