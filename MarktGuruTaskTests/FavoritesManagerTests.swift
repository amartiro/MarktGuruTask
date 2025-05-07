//
//  FavoritesManagerTests.swift
//  MarktGuruTaskTests
//
//  Created by Artak Martirosyan on 07.05.25.
//

import XCTest
@testable import MarktGuruTask

final class FavoritesManagerTests: XCTestCase {
    
    var sut: FavoritesManager!
    
    override func setUp() {
        super.setUp()
        sut = FavoritesManager()
        sut.cleanUp()
    }
    
    override func tearDown() {
        sut.cleanUp()
        sut = nil
        super.tearDown()
    }
    
    
    func test_whenToggleFavoriteAddsAndRemoves_shouldBeFavorite() {
        // Given
        let testId = "testId"
        
        // When
        sut.toggleFavorite(id: testId)
        
        // Then
        XCTAssertTrue(sut.isFavorite(id: testId), "Product should be favorited")
        
    }
    
    func test_whenToggleFavoriteAddsAndRemoves_shouldBeUnFavorite() {
        // Given
        let testId = "testId"
        
        // When
        sut.toggleFavorite(id: testId)
        sut.toggleFavorite(id: testId)
        
        // Then
        XCTAssertFalse(sut.isFavorite(id: testId), "Product should not be favorited")
    }
    
    func test_WhenFavoritesPersistence_souldPersistAcrossInstances() {
        // Given
        let testId = "testId"
        
        // When
        sut.toggleFavorite(id: testId)
        let manager2 = FavoritesManager()
        
        // Then
        XCTAssertTrue(manager2.isFavorite(id: testId), "Favorite should persist across instances")
    }
    
}
