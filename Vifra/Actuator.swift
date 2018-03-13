//
//  Actuator.swift
//  Vifra
//
//  Created by Matis Schotte on 11.03.18.
//  Copyright © 2018 ungeord.net. All rights reserved.
//

/// Internal wrapper for the actuator functions.
enum Actuator {
    static var create = MTActuatorCreateFromDeviceID
    static var open = MTActuatorOpen
    static var close = MTActuatorClose
    static var actuate = MTActuatorActuate
}
