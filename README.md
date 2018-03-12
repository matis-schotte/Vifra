# Vifra

[![Build Status](https://travis-ci.org/matis-schotte/Vifra.svg?branch=develop)](https://travis-ci.org/matis-schotte/Vifra)
[![codecov](https://codecov.io/gh/matis-schotte/Vifra/branch/develop/graph/badge.svg)](https://codecov.io/gh/matis-schotte/Vifra)
[![codebeat badge](https://codebeat.co/badges/d4b387f7-639d-4c96-b6d3-13538bb8151c)](https://codebeat.co/projects/github-com-matis-schotte-vifra-develop)
[![license](https://img.shields.io/github/license/matis-schotte/Vifra.svg)](./LICENSE)
[![Open Source Helpers](https://www.codetriage.com/matis-schotte/vifra/badges/users.svg)](https://www.codetriage.com/matis-schotte/vifra)
![platform](https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20watchOS-lightgrey.svg)

[![Twitter](https://img.shields.io/badge/twitter-@matis_schotte-blue.svg)](http://twitter.com/matis_schotte)
![Ethereum](https://img.shields.io/badge/ethereum-0x25C93954ad65f1Bb5A1fd70Ec33f3b9fe72e5e58-yellowgreen.svg)
![Litecoin](https://img.shields.io/badge/litecoin-MPech47X9GjaatuV4sQsEzoMwGMxKzdXaH-lightgrey.svg)

Vifra is a framework for macOS, iOS and watchOS that provides simplified access to the device actuator to provide haptic feedback through the taptic engine.

## Requirements
- macOS

[//]: # (Installation: Manual)

## Usage
Before you can use the taptic engine it needs to be initialized with `Vifra.setup()`.
You can then use the taptic engine with `Vifra.actuate(...)` providing four arguments.
Last but not least you should indicate when you are done with the actuator and close the device with `Vifra.teardown()`.
```swift
let didSetup = Vifra.setup()
let didActuate = Vifra.actuate(...)
let didTeardown = Vifra.teardown()
```

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

## Author
Matis Schotte, [dm26f1cab8aa26@ungeord.net](mailto:dm26f1cab8aa26@ungeord.net)

[https://github.com/matis-schotte/Vifra](https://github.com/matis-schotte/Vifra)
