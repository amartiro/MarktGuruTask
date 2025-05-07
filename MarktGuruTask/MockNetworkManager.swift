//
//  MockAPI.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

import UIKit

struct MockNetworkManager: NetworkManaging {
    
    func getProducts(offset: Int, limit: Int) async throws -> [Product] {
        (0..<limit).map {
            Product(
                id: "\(offset * limit + $0)",
                name: "Product \(offset * limit + $0)",
                price: Double.random(in: 10...100),
                description: "Description for product \(offset * limit + $0) Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.",
                imageURL: "https://i.imgur.com/QkIa5tT.jpeg"
            )
        }
    }
    
    static func getDummyProduct() -> Product {
        Product(
            id: "12",
            name: "Product 12",
            price: 54.23,
            description: "Description for product 12 Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.",
            imageURL: "https://i.imgur.com/QkIa5tT.jpeg"
        )
    }
}
