# Vifra

[![Build Status](https://travis-ci.org/matis-schotte/Vifra.svg?branch=develop)](https://travis-ci.org/matis-schotte/Vifra)
[![codebeat badge](https://codebeat.co/badges/d4b387f7-639d-4c96-b6d3-13538bb8151c)](https://codebeat.co/projects/github-com-matis-schotte-vifra-develop)
[![codecov](https://codecov.io/gh/matis-schotte/Vifra/branch/develop/graph/badge.svg)](https://codecov.io/gh/matis-schotte/Vifra)
[![Maintainability](https://api.codeclimate.com/v1/badges/ef99565e7d56efc70b4b/maintainability)](https://codeclimate.com/github/matis-schotte/Vifra/maintainability)
[![Docs](https://matis-schotte.github.io/Vifra/badge.svg)](https://matis-schotte.github.io/Vifra/)
[![license](https://img.shields.io/github/license/matis-schotte/Vifra.svg)](./LICENSE)

[![Version](https://img.shields.io/cocoapods/v/Vifra.svg)](http://cocoapods.org/pods/Vifra)
[![Open Source Helpers](https://www.codetriage.com/matis-schotte/vifra/badges/users.svg)](https://www.codetriage.com/matis-schotte/vifra)
![platform](https://img.shields.io/badge/platform-macOS%20%7C%20iOS%20%7C%20watchOS-lightgrey.svg)
[![Twitter](https://img.shields.io/badge/twitter-@matis_schotte-blue.svg)](http://twitter.com/matis_schotte)

![Ethereum](https://img.shields.io/badge/ethereum-0x25C93954ad65f1Bb5A1fd70Ec33f3b9fe72e5e58-yellowgreen.svg)
![Litecoin](https://img.shields.io/badge/litecoin-MPech47X9GjaatuV4sQsEzoMwGMxKzdXaH-lightgrey.svg)

Vifra is a framework for macOS, iOS and watchOS that provides simplified access to the device actuator to provide haptic feedback (vibration through the taptic engine).

## Requirements
- Swift >= 4
- macOS >= 10.12
- watchOS >= 2.0

## Installation
### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. It is in early development, but Vifra does support its use on supported platforms.

Once you have your Swift package set up, adding Vifra as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/matis-schotte/Vifra.git", from: "0.4.0")
]
```

Do not forget to ensure that the deployment target is set to the correct version (e.g. macOS 10.12), and that all necessary Frameworks are linked (e.g. MultitouchSupport.framework). To avoid getting "undefined symbols" the Bridging header should be used. Possible build command could be:

```bash
$ swift build -Xswiftc "-target" -Xswiftc "x86_64-apple-macosx10.12" -Xswiftc "-import-objc-header" -Xswiftc ".build/checkouts/Vifra.git-6919244937016367571/Vifra/Vifra-Bridging-Header.h" -Xlinker -F/System/Library/PrivateFrameworks -Xlinker -lMultitouchSupport && swift run
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate Vifra into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "matis-schotte/Vifra" ~> 0.4
```

Run `carthage update` to build the framework and drag the built `Vifra.framework` into your Xcode project.

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Vifra into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'Vifra'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use any of the aforementioned dependency managers, you can integrate Vifra into your project manually.

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

```bash
$ git init
```

- Add Vifra as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

```bash
$ git submodule add https://github.com/matis-schotte/Vifra.git
```

- Open the new `Vifra` folder, and drag the `Vifra.xcodeproj` into the Project Navigator of your application's Xcode project.
- Select the `Vifra.xcodeproj` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see the `Vifra.framework` somewhere, just select the correct version.
- And that's it, try `import Vifra`!

## Usage
You can issue haptic feedback with just any of the following lines using any of the predefined enum values:
```swift
Vifra.feedback(.strong)
Vifra.feedback([.strong, .weak, .delay(usec: 500_000), .strong])
```

[//]: # (Example: See the example project snside the `examples/` folder.)

## Know problems
- macOS: A private framework is used; it is therefore unlikely to be accepted in the app store.
- macOS: You cannot enable the sandboxing entitlement; if you do you'll encounter the error -536870174 during `Vifra.setup()` which is internally being called from `Vifra.feedback()`.

## ToDo
- Add Carthage support
- Add iOS support (UIFeedbackGenerator and AudioServicesPlaySystemSound(kSystemSoundID_Vibrate))
- Update macOS support (NSHapticFeedbackPerformer)

[//]: # (Donations: ETH, LTC welcome.)

## License
Vifra is available under the MIT license. See the [LICENSE](https://github.com/matis-schotte/Vifra/blob/develop/LICENSE) file for more info.

## Author
Matis Schotte, [dm26f1cab8aa26@ungeord.net](mailto:dm26f1cab8aa26@ungeord.net)

[https://github.com/matis-schotte/Vifra](https://github.com/matis-schotte/Vifra)
