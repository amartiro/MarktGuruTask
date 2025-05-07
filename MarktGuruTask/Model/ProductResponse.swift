//
//  ProductResponse.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 07.05.25.
//

struct ProductResponse: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let images: [String]
}
