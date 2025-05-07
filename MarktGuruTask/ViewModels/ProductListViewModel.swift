//
//  ProductListViewModel.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

import SwiftUI
import Observation

protocol ProductListViewModeling: ObservableObject {
    var products: [Product] { get }
    var favoritesManager: FavoritesManager { get set }
    var alertItem: AlertItem? { get set }
    
    func onAppear()
    func loadMoreProducts()
    init(networkManager: NetworkManaging, favoritesManager: FavoritesManager)
}

final class ProductListViewModel: ProductListViewModeling {
    var favoritesManager: FavoritesManager
    
    @Published var products: [Product] = []
    
    @Published var alertItem: AlertItem?
    
    private var currentPage = 0
    private let pageSize = 5
    private var networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging, favoritesManager: FavoritesManager) {
        self.networkManager = networkManager
        self.favoritesManager = favoritesManager
    }
    
    func loadMoreProducts() {
        Task{
            do {
                let newProducts = try await networkManager.getProducts(offset: currentPage, limit: pageSize)
                await MainActor.run {
                    let filtered = getFiltered(newProducts: newProducts)
                    if !filtered.isEmpty {
                        products += filtered
                        currentPage += 1
                    } else {
                        alertItem = AlertContext.noNewProducts
                    }
                }
                currentPage += 1
            } catch {
                if let error = error as? NetworkError {
                    await MainActor.run {
                        switch error {
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .requestFailed(_):
                            alertItem = AlertContext.requestFailed
                        case .decodingError(_):
                            alertItem = AlertContext.decodingError
                        case .unknown(_):
                            alertItem = AlertContext.unknown
                        }
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                print("Error: ", error.localizedDescription)
            }
        }
    }
    
    private func getFiltered(newProducts: [Product]) -> [Product] {
        let newProductsIds = Set(newProducts.map { $0.id }).subtracting(products.map { $0.id })
        return newProducts.filter { newProductsIds.contains($0.id) }
    }
    
    func onAppear() {
        if products.isEmpty {
            loadMoreProducts()
        }
    }
}
