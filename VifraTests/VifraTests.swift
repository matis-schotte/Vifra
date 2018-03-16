//
//  VifraTests.swift
//  VifraTests
//
//  Created by Matis Schotte on 15.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

@testable import Vifra
import XCTest

class VifraTests: XCTestCase {
    override func setUp() {
        super.setUp()
        
        ActuatorMock.setupActuatorMocks()
    }
    
    func testSingleHaptic() {
        // Given
        // When
        Vifra.feedback(.once)
        
        // Then
        XCTAssertFalse(ActuatorMock.actuatorIsOpen)
        XCTAssertEqual(ActuatorMock.actuateCalled, 1)
    }
    
    func testMultipleHaptics() {
        // Given
        // When
        Vifra.feedback([.once, .twice])
        
        // Then
        XCTAssertFalse(ActuatorMock.actuatorIsOpen)
        XCTAssertEqual(ActuatorMock.actuateCalled, 2)
    }
}
