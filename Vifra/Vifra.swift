//
//  Vifra.swift
//  Vifra
//
//  Created by Matis Schotte on 02.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

import IOKit
import os.log

/// Vifra is a framework for macOS, iOS and WatchKit that provides simplified access
/// to the device actuator to provide haptic feedback through the taptic engine.
public enum Vifra {
    /// <#Description#>
    public struct ActuatorParameters {
        /// <#Description#>
        let arg1: UInt32
        /// <#Description#>
        let arg2: Float32
        /// <#Description#>
        let arg3: Float32
    }
    
    private static let multitouchActuatorDeviceId: UInt64 = 0x200_0000_0100_0000
    private static var actuatorReference: AnyObject?
    
    /// Initializes Vifra by opening the actuator device.
    ///
    /// - Returns: true on success.
    @discardableResult
    public static func setup() -> Bool {
        guard actuatorReference == nil else {
            os_log("Vifra already setup.")
            return true
        }
        
        let device = Actuator.create(multitouchActuatorDeviceId).takeRetainedValue()
        let error = Actuator.open(device)
        guard error == kIOReturnSuccess else {
            os_log("Vifra setup failed, error: %d", error)
            return false
        }
        actuatorReference = device
        return true
    }
    
    /// Cleans up Vifra by closing the actuator device.
    ///
    /// - Returns: true on success.
    @discardableResult
    public static func teardown() -> Bool {
        guard let device = actuatorReference else {
            os_log("Vifra not initialized or already torn down.")
            return true
        }
        
        let error = Actuator.close(device)
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
    ///   - actuatonId: <#actuatonId description#>
    ///   - parameters: <#parameters description#>
    /// - Returns: true on success.
    @discardableResult
    public static func actuate(_ actuatonId: Int32, parameters: ActuatorParameters) -> Bool {
        guard let device = actuatorReference else {
            os_log("Vifra not initialized, call 'Vifra.setup()' first.")
            return false
        }
        
        let result = Actuator.actuate(device, actuatonId, parameters.arg1, parameters.arg2, parameters.arg3)
        return result == kIOReturnSuccess
    }
}
