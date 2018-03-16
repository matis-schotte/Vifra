//
//  ActuatorMock.swift
//  VifraTests
//
//  Created by Matis Schotte on 15.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

import Foundation
@testable import Vifra

enum ActuatorMock {
    static var actuatorIsOpen = false
    static var actuateCalled = 0
    
    static func setupActuatorMocks() {
        ActuatorMock.actuateCalled = 0
        
        Actuator.create = { _ in Unmanaged.passUnretained(NSString()) }
        Actuator.open = { _ in
            guard !ActuatorMock.actuatorIsOpen else { return kIOReturnError }
            ActuatorMock.actuatorIsOpen = true
            return kIOReturnSuccess
        }
        Actuator.close = { _ in
            guard ActuatorMock.actuatorIsOpen else { return kIOReturnError }
            ActuatorMock.actuatorIsOpen = false
            return kIOReturnSuccess
        }
        Actuator.actuate = { _, _, _, _, _ in
            ActuatorMock.actuateCalled += 1
            return kIOReturnSuccess
        }
    }
}
