//
//  ActuatorTests.swift
//  VifraTests
//
//  Created by Matis Schotte on 10.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

@testable import Vifra
import XCTest

class ActuatorTests: XCTestCase {
    static let params = Actuator.Parameters(arg1: 0, arg2: 1.0, arg3: 1.5)
    
    override func setUp() {
        super.setUp()
        
        ActuatorMock.setupActuatorMocks()
    }
    
    override func tearDown() {
        Actuator.teardown()
        _ = Actuator.close(NSString())
        
        super.tearDown()
    }
    
    func testSetup() {
        // Given
        // When
        let success = Actuator.setup()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testMultiSetup() {
        // Given
        XCTAssertTrue(Actuator.setup())
        
        // When
        let success = Actuator.setup()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testSetupNegative() {
        // Given
        _ = Actuator.open(NSString())
        
        // When
        let success = Actuator.setup()
        
        // Then
        XCTAssertFalse(success)
    }
    
    func testTeardown() {
        // Given
        XCTAssertTrue(Actuator.setup())
        
        // When
        let success = Actuator.teardown()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testMultiTeardown() {
        // Given
        XCTAssertTrue(Actuator.teardown())
        
        // When
        let success = Actuator.teardown()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testTeardownNegative() {
        // Given
        XCTAssertTrue(Actuator.setup())
        _ = Actuator.close(NSString())
        
        // When
        let success = Actuator.teardown()
        
        // Then
        XCTAssertFalse(success)
    }
    
    func testActuator() {
        // Given
        XCTAssertTrue(Actuator.setup())
        
        // When
        let success = Actuator.actuate(6, parameters: ActuatorTests.params)
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testActuatorNegative() {
        // Given
        // When
        let success = Actuator.actuate(6, parameters: ActuatorTests.params)
        
        // Then
        XCTAssertFalse(success)
    }
    
    func testPerformanceSetupTeardown() {
        measure {
            XCTAssertTrue(Actuator.setup())
            XCTAssertTrue(Actuator.teardown())
        }
    }
}
