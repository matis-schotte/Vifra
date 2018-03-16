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
    /// A single haptic.
    case once
    /// A double haptic.
    case twice
    
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
            Actuator.actuate(6, parameters: parameters(for: type))
            // usleep?
        }
        
        Actuator.teardown()
    }
    
    private static func parameters(for types: Vifra) -> Actuator.Parameters {
        _ = types
        return Actuator.Parameters(arg1: 0, arg2: 1.0, arg3: 1.5)
    }
}
