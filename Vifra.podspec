Pod::Spec.new do |s|
  s.name         = "Vifra"
  s.version      = "0.2.0"
  s.summary      = "Easy Haptic Feedback in Swift"
  s.description  = <<-DESC
Vifra is a framework for macOS, iOS and watchOS that provides simplified access to the device actuator to provide haptic feedback through the taptic engine.
                   DESC
  s.homepage     = "https://github.com/matis-schotte/Vifra"
  s.license      = "MIT"

  s.author             = { "Matis Schotte" => "dm26f1cab8aa26@ungeord.net" }
  s.social_media_url   = "https://twitter.com/matis_schotte"

  # s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.12"
  # s.watchos.deployment_target = "2.0"

  s.source       = { :git => "https://github.com/matis-schotte/Vifra.git", :tag => s.version }
  s.source_files = "Vifra/*.{h,swift}"
  s.swift_version = "4.0"
  s.framework    = "MultitouchSupport"
  s.xcconfig     =  { "FRAMEWORK_SEARCH_PATHS" => "$(SYSTEM_LIBRARY_DIR)/PrivateFrameworks" }
end
