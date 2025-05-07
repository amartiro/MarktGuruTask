//
//  Product.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 05.05.25.
//

struct Product: Identifiable {
    let id: String
    let name: String
    let price: Double
    let description: String
    let imageURL: String
    
    init(id: String, name: String, price: Double, description: String, imageURL: String) {
        self.id = id
        self.name = name
        self.price = price
        self.description = description
        self.imageURL = imageURL
    }
    
    init(productResponse: ProductResponse) {
        self.id = "\(productResponse.id)"
        self.name = productResponse.title
        self.price = productResponse.price
        self.description = productResponse.description
        self.imageURL = productResponse.images.first ?? ""
    }
}

enum DummyProduct {
    static var dummy: Product { Product(
            id: "12",
            name: "Product 12",
            price: 54.23,
            description: "Description for product 12 Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.",
            imageURL: "https://i.imgur.com/QkIa5tT.jpeg"
        )
    }
}
