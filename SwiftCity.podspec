Pod::Spec.new do |s|

  s.name                  = "SwiftCity"
  s.version               = "0.2"
  s.summary               = "A TeamCity API Client written in Swift."
  s.description           = <<-DESC
                              # SwiftCity
                              A TeamCity API Client written in Swift

                              This is a _Work-In-Progress_ - with more endpoints coming soon.
                              This project is inspired by [TeamCitySharp](https://github.com/stack72/teamcitysharp).

                              See the [README](https://github.com/tombuildsstuff/swiftcity) for more info
                               ```
                              DESC
  s.homepage               = "https://github.com/tombuildsstuff/swiftcity"
  s.license                = "MIT"
  s.author                 = "tombuildsstuff"
  s.social_media_url       = "http://twitter.com/tombuildsstuff"
  s.source                 = { :git => "https://github.com/tombuildsstuff/swiftcity.git", :tag => "0.2" }
  s.source_files           = "Sources/SwiftCity", "Sources/SwiftCity/**/*.{h,swift}"
  s.exclude_files          = "Sources/SwiftCity/**/main.swift"
  s.framework              = "Foundation"
  s.ios.deployment_target  = "8.0"
  s.tvos.deployment_target = "9.0"
  s.osx.deployment_target  = "10.10"
  s.requires_arc           = true

end
