//
//  FavoritesManager.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

import Foundation

@Observable
final class FavoritesManager {
    private var favoriteIds: Set<String> = []
    private let key = "favorite_products"
    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        favoriteIds = Set(defaults.stringArray(forKey: key) ?? [])
    }

    func toggleFavorite(id: String) {
        if favoriteIds.contains(id) {
            favoriteIds.remove(id)
        } else {
            favoriteIds.insert(id)
        }
        defaults.set(Array(favoriteIds), forKey: key)
    }

    func isFavorite(id: String) -> Bool {
        favoriteIds.contains(id)
    }
    
    func cleanUp() {
        favoriteIds.removeAll()
        defaults.set(Array(favoriteIds), forKey: key)
    }
}
