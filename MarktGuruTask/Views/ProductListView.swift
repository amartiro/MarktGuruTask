//
//  ProductListView.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

import SwiftUI

struct ProductListView<ViewModel: ProductListViewModeling>: View {
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.products) { product in
                    NavigationLink(
                        destination: ProductDetailView(product: product,
                                                       favoritesManager: viewModel.favoritesManager)
                    ) {
                        let isFavorite = viewModel.favoritesManager.isFavorite(id: product.id)
                        ProductListCellView(product: product, isFavorite: isFavorite)
                    }
                }
                HStack {
                    Spacer()

                    Button(KeyConstants.Title.loadMore) {
                        viewModel.loadMoreProducts()
                    }

                    Spacer()
                }
            }
            .navigationTitle(KeyConstants.Title.products)
            .onAppear {
                viewModel.onAppear()
            }
        }
    }
}

#Preview {
    let viewModel = ProductListViewModel(networkManager: MockNetworkManager(), favoritesManager: FavoritesManager())
    ProductListView(viewModel: viewModel)
}
