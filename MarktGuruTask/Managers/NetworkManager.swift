//
//  NetworkManager.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

import UIKit

protocol NetworkManaging {
    func getProducts(offset: Int, limit: Int) async throws -> [Product]
}

final class NetworkManager: NetworkManaging {

    private let session: URLSession

    private static let baseURL = "https://api.escuelajs.co/api/v1/"
    private let productURL = baseURL + "products?offset=%d&limit=%d"
    
    init(session: URLSession) {
        self.session = session
    }

    private func fetch<T: Decodable>(from urlString: String, as type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let request = URLRequest(url: url)
       
        do {
            let (data, response) = try await session.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.requestFailed(-1)
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.requestFailed(httpResponse.statusCode)
            }

            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                return decoded
            } catch {
                throw NetworkError.decodingError(error)
            }

        } catch {
            throw NetworkError.unknown(error)
        }
    }
    
    func getProducts(offset: Int, limit: Int) async throws -> [Product] {
        let urlString = String(format: productURL, offset * limit, limit)
        return try await fetch(from: urlString, as: [ProductResponse].self)
                         .map { Product(productResponse: $0) }
    }
}
