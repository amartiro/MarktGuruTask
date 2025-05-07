//
//  ProductTests.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 07.05.25.
//

import XCTest
@testable import MarktGuruTask


final class ProductTests: XCTestCase {
    var sut: Product!
    
    override func setUp() {
        super.setUp()
        sut = Product(id: "12",
                      name: "Product 12",
                      price: 54.23,
                      description: "Description for product 12",
                      imageURL: "https://i.imgur.com/QkIa5tT.jpeg"
                    )
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_ProductInitializer_shouldAssignCorrectValues() {
        // Given

        // Then
        XCTAssertEqual(sut.id, "12")
        XCTAssertEqual(sut.name, "Product 12")
        XCTAssertEqual(sut.price, 54.23)
        XCTAssertEqual(sut.description, "Description for product 12")
        XCTAssertEqual(sut.imageURL, "https://i.imgur.com/QkIa5tT.jpeg")
    }
}
