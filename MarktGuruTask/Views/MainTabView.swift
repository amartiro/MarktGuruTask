//
//  MainTabView.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 06.05.25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            let sessionConfig = URLSessionConfiguration.default
            let urlSession = URLSession(configuration: sessionConfig)
            let viewModel = ProductListViewModel(
                networkManager: NetworkManager(session: urlSession),
                favoritesManager: FavoritesManager()
            )
            
            ProductListView(viewModel: viewModel)
                .tabItem {
                    Label(KeyConstants.Title.products, systemImage: KeyConstants.Icon.product)
                }
            SettingsView()
                .tabItem {
                    Label(KeyConstants.Title.settings, systemImage: KeyConstants.Icon.settings)
                }
        }
    }
}

#Preview {
    MainTabView()
}
