//
//  Vifra.swift
//  Vifra
//
//  Created by Matis Schotte on 30.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

import Foundation

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
    public static func feedback(_: [Vifra]) {
    }
}
