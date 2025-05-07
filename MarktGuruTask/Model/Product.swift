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



