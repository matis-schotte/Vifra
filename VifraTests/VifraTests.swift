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
    static var actuatorIsOpen = false
    
    override func setUp() {
        super.setUp()
        
        setupActuatorMocks()
    }
    
    override func tearDown() {
        Vifra.teardown()
        _ = Actuator.close(NSString())
        
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
    
    func testSetupNegative() {
        // Given
        _ = Actuator.open(NSString())
        
        // When
        let success = Vifra.setup()
        
        // Then
        XCTAssertFalse(success)
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
        XCTAssertTrue(Vifra.teardown())
        
        // When
        let success = Vifra.teardown()
        
        // Then
        XCTAssertTrue(success)
    }
    
    func testTeardownNegative() {
        // Given
        XCTAssertTrue(Vifra.setup())
        _ = Actuator.close(NSString())
        
        // When
        let success = Vifra.teardown()
        
        // Then
        XCTAssertFalse(success)
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
    
    // MARK: - Private
    
    private func setupActuatorMocks() {
        Actuator.create = { _ in Unmanaged.passUnretained(NSString()) }
        Actuator.open = { _ in
            guard !VifraTests.actuatorIsOpen else { return kIOReturnError }
            VifraTests.actuatorIsOpen = true
            return kIOReturnSuccess
        }
        Actuator.close = { _ in
            guard VifraTests.actuatorIsOpen else { return kIOReturnError }
            VifraTests.actuatorIsOpen = false
            return kIOReturnSuccess
        }
        Actuator.actuate = { _, _, _, _, _ in kIOReturnSuccess }
    }
}
