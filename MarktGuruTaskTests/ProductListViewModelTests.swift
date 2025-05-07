//
//  ProductListViewModelTests.swift
//  MarktGuruTask
//
//  Created by Artak Martirosyan on 07.05.25.
//

import XCTest
import Combine
@testable import MarktGuruTask


final class ProductListViewModelTests: XCTestCase {
    var sut: ProductListViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        let networkManager = MockNetworkManager()
        sut = ProductListViewModel(networkManager: networkManager, favoritesManager: FavoritesManager())
        cancellables = []
    }
    
    override func tearDown() {
        sut = nil
        cancellables = nil
        super.tearDown()
    }
    
    func test_initialProducts_shouldBeEmpty() {
        //Then
        XCTAssertTrue(sut.products.isEmpty)
    }
    
    func test_loadMoreProductsCount_shouldBeIncrease() {
        
        XCTAssertTrue(sut.products.isEmpty)
        
        let expectation = XCTestExpectation(description: "Published products should change")

        sut.$products
            .dropFirst()
            .sink { products in
                XCTAssert(products.count == 5, "sut.products.count")
                expectation.fulfill()
            }
            .store(in: &cancellables)
     
        sut.loadMoreProducts()
        wait(for: [expectation], timeout: 1.0)
    }
}
