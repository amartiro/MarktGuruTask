//
//  MarktGuruTaskTests.swift
//  MarktGuruTaskTests
//
//  Created by Artak Martirosyan on 05.05.25.
//

import XCTest
@testable import MarktGuruTask

final class MarktGuruTaskTests: XCTestCase {
    var sut: SettingsManager!
    
    override func setUp() {
        super.setUp()
        sut = SettingsManager()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_InitialValeSetupFalse() {
        // Given
        
        // When
        sut.darkModeEnabled = false
        
        // Then
        XCTAssertFalse(sut.darkModeEnabled)
    }
    
    func test_InitialValeSetupTrue() {
        // Given
        
        // When
        sut.darkModeEnabled = true
        
        // Then
        XCTAssertTrue(sut.darkModeEnabled)
    }
}
