Pod::Spec.new do |s|
  s.name         = "Vifra"
  s.version      = "0.3.0"
  s.summary      = "Easy Haptic Feedback (Vibration) in Swift"
  s.description  = <<-DESC
Vifra is a framework for macOS, iOS and watchOS that provides simplified access to the device actuator to provide haptic feedback (vibration through the taptic engine).
                   DESC
  s.homepage     = "https://github.com/matis-schotte/Vifra"
  s.documentation_url = "https://matis-schotte.github.io/Vifra"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Matis Schotte" => "dm26f1cab8aa26@ungeord.net" }
  s.social_media_url   = "https://twitter.com/matis_schotte"

  s.platform = :osx, "10.12"
  # s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.12"
  s.osx.framework    = "MultitouchSupport"
  # s.watchos.deployment_target = "2.0"

  s.source       = { :git => "https://github.com/matis-schotte/Vifra.git", :tag => s.version }
  s.source_files = "Vifra/*.{h,swift}"
  s.swift_version = "4.0"
  s.xcconfig     =  { "FRAMEWORK_SEARCH_PATHS" => "$(SYSTEM_LIBRARY_DIR)/PrivateFrameworks" }
end
