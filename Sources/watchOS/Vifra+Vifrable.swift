//
//  Vifra+Vifrable.swift
//  Vifra
//
//  Created by Matis Schotte on 30.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

import WatchKit

extension Vifra: Vifrable {
    /// Blocking call to play multiple haptics.
    ///
    /// - Parameter types: The types of haptic to play.
    public static func feedback(_ types: [Vifra]) {
        for type in types {
            guard let actuationType = type.actuationType else { continue }
            
            WKInterfaceDevice.current().play(actuationType)
            usleep(8500)
        }
    }
    
    private var actuationType: WKHapticType? {
        switch self {
        case .weak:
            return .click
        case .medium:
            return .click
        case .strong:
            return .click
        case let .delay(usec):
            usleep(usec)
            return nil
        }
    }
}
