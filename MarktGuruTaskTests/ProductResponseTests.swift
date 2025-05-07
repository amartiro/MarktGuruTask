//
//  ProductResponseTests.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 07.05.25.
//

import XCTest
@testable import MarktGuruTask

final class ProductResponseTests: XCTestCase {
    var sut: ProductResponse!
    
    override func setUp() {
        super.setUp()
        sut = ProductResponse(id: 12,
                              title: "Product 12",
                              price: 54.23,
                              description: "Description for product 12",
                              images: ["https://i.imgur.com/QkIa5tT.jpeg"]
        )
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testProductResponseInitializer() {
        // Then
        XCTAssertEqual(sut.id, 12)
        XCTAssertEqual(sut.title, "Product 12")
        XCTAssertEqual(sut.price, 54.23)
        XCTAssertEqual(sut.description, "Description for product 12")
        XCTAssertEqual(sut.images, ["https://i.imgur.com/QkIa5tT.jpeg"])
    }
    
    func testProductResponseToProduct() {
        // Given
        let product = Product(productResponse: sut)
        
        // Then
        XCTAssertEqual(product.id, "12")
        XCTAssertEqual(product.name, "Product 12")
        XCTAssertEqual(product.price, 54.23)
        XCTAssertEqual(product.description, "Description for product 12")
        XCTAssertEqual(product.imageURL, "https://i.imgur.com/QkIa5tT.jpeg")
    }
}
