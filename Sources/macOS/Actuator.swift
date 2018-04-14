//
//  Actuator.swift
//  Vifra
//
//  Created by Matis Schotte on 11.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

import IOKit
import os.log

/// Internal wrapper for the actuator.
enum Actuator {
    typealias Parameters = (arg1: UInt32, arg2: Float32, arg3: Float32)
    
    static var device = (create: MTActuatorCreateFromDeviceID,
                         open: MTActuatorOpen,
                         close: MTActuatorClose,
                         actuate: MTActuatorActuate)
    
    private static let multitouchActuatorDeviceId: UInt64 = 0x200_0000_0100_0000
    private static var actuatorReference: AnyObject?
    
    /// Initializes Vifra by opening the actuator device.
    ///
    /// - Returns: true on success.
    @discardableResult
    static func setup() -> Bool {
        guard actuatorReference == nil else {
            os_log("Vifra already setup.")
            return true
        }
        
        let actuator = device.create(multitouchActuatorDeviceId).takeRetainedValue()
        let error = device.open(actuator)
        guard error == kIOReturnSuccess else {
            os_log("Vifra setup failed, error: %d", error)
            return false
        }
        actuatorReference = actuator
        return true
    }
    
    /// Cleans up Vifra by closing the actuator device.
    ///
    /// - Returns: true on success.
    @discardableResult
    static func teardown() -> Bool {
        guard let actuator = actuatorReference else {
            os_log("Vifra not initialized or already torn down.")
            return true
        }
        
        let error = device.close(actuator)
        guard error == kIOReturnSuccess else {
            os_log("Vifra teardown failed, error: %d", error)
            return false
        }
        actuatorReference = nil
        return true
    }
    
    /// Plays the taptic engine to provide haptic feedback.
    ///
    /// - Parameters:
    ///   - actuatonId: Either one of 1, 2, 3, 4, 5, 6, 15, and 16.
    ///   - parameters: The actuator variables.
    /// - Returns: true on success.
    @discardableResult
    static func actuate(_ actuatonId: Int32, parameters: Parameters) -> Bool {
        guard let actuator = actuatorReference else {
            os_log("Vifra not initialized, call 'Vifra.setup()' first.")
            return false
        }
        
        let result = device.actuate(actuator, actuatonId, parameters.arg1, parameters.arg2, parameters.arg3)
        return result == kIOReturnSuccess
    }
}
