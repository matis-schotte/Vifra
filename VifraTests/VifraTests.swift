//
//  VifraTests.swift
//  VifraTests
//
//  Created by Matis Schotte on 10.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

@testable import Vifra
import XCTest

class VifraTests: XCTestCase {
    static let params = Vifra.ActuatorParameters(arg1: 0, arg2: 1.0, arg3: 1.5)
    
    override func tearDown() {
        Vifra.teardown()
        super.tearDown()
    }
    
    func testSetup() {
        // Given
        // When
        let success = Vifra.setup()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testMultiSetup() {
        // Given
        XCTAssertTrue(Vifra.setup())
        
        // When
        let success = Vifra.setup()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testTeardown() {
        // Given
        XCTAssertTrue(Vifra.setup())
        
        // When
        let success = Vifra.teardown()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testMultiTeardown() {
        // Given
        // When
        let success = Vifra.teardown()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testActuator() {
        // Given
        XCTAssertTrue(Vifra.setup())
        
        // When
        let success = Vifra.actuate(6, parameters: VifraTests.params)
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testActuatorNegative() {
        // Given
        // When
        let success = Vifra.actuate(6, parameters: VifraTests.params)
        
        // Then
        XCTAssertFalse(success)
    }
    
    func testPerformanceSetupTeardown() {
        measure {
            XCTAssertTrue(Vifra.setup())
            XCTAssertTrue(Vifra.teardown())
        }
    }
}
