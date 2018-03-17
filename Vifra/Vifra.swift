//
//  Vifra.swift
//  Vifra
//
//  Created by Matis Schotte on 02.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

/// Vifra is a framework for macOS, iOS and WatchKit that provides simplified access
/// to the device actuator to provide haptic feedback through the taptic engine.
public enum Vifra {
    /// A weak haptic.
    case weak
    /// A medium haptic.
    case medium
    /// A strong haptic.
    case strong
    /// A delay between haptics (after each successful haptic a min delay of 8500 usec is enforced).
    case delay(usec: UInt32)
    
    /// Blocking call to play a single haptic.
    ///
    /// - Parameter type: The type of haptic to play.
    public static func feedback(_ type: Vifra) {
        feedback([type])
    }
    
    /// Blocking call to play multiple haptics.
    ///
    /// - Parameter types: The types of haptic to play.
    public static func feedback(_ types: [Vifra]) {
        Actuator.setup()
        
        for type in types {
            guard let actuationID = type.actuationID else { continue }
            
            let params = Actuator.Parameters(arg1: 0, arg2: 1.0, arg3: 1.5)
            Actuator.actuate(actuationID, parameters: params)
            usleep(8500)
        }
        
        Actuator.teardown()
    }
    
    private var actuationID: Int32? {
        switch self {
        case .weak:
            return 3
        case .medium:
            return 4
        case .strong:
            return 6
        case let .delay(usec):
            usleep(usec)
            return nil
        }
    }
}
