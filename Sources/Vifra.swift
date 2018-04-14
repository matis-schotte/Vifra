//
//  Vifra.swift
//  Vifra
//
//  Created by Matis Schotte on 02.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

import Foundation

/// The main API declaring the different haptic types.
public enum Vifra {
    /// A weak haptic.
    case weak
    /// A medium haptic.
    case medium
    /// A strong haptic.
    case strong
    /// A delay between haptics (after each successful haptic a min delay of 8500 usec is enforced).
    case delay(usec: UInt32)
}

/// The main API declaring the available methods.
public protocol Vifrable {
    /// Blocking call to play a single haptic.
    ///
    /// - Parameter type: The type of haptic to play.
    static func feedback(_ type: Vifra)
    
    /// Blocking call to play multiple haptics.
    ///
    /// - Parameter types: The types of haptic to play.
    static func feedback(_ types: [Vifra])
}

extension Vifrable {
    /// Blocking call to play a single haptic.
    ///
    /// - Parameter type: The type of haptic to play.
    public static func feedback(_ type: Vifra) {
        feedback([type])
    }
}
