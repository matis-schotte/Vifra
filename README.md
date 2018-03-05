# Vifra

[![Build Status](https://travis-ci.org/matis-schotte/Vifra.svg?branch=develop)](https://travis-ci.org/matis-schotte/Vifra)

Vifra is a framework for macOS, iOS and watchOS that provides simplified access to the device actuator to provide haptic feedback through the taptic engine.

## Requirements
- macOS

[//]: # (Installation: Manual)

## Usage
Before you can use the taptic engine it needs to be initialized with `Vifra.setup()`.
You can then use the taptic engine with `Vifra.actuate(...)` providing four arguments.
Last but not least you should indicate when you are done with the actuator and close the device with `Vifra.teardown()`.

[//]: # (Example: See the example project snside the `examples/` folder.)

## Know problems
- macOS: A private framework is used; it is therefore unlikely to be accepted in the app store.
- macOS: You cannot enable the sandboxing entitlement; if you do you'll encounter the error -536870174 during `Vifra.setup()`

## ToDo
- Add SwiftPM support
- Add Cocoapods support
- Add Carthage support
- Add iOS support
- Add watchOS support

[//]: # (Donations: ETH, XMR, BTC, LTC welcome.)

## License
Vifra is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
