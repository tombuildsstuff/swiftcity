Pod::Spec.new do |s|

  s.name                 = "SwiftCity"
  s.version              = "0.0.6"
  s.summary              = "A TeamCity API Client written in Swift."
  s.description          = <<-DESC
                              # SwiftCity
                              A TeamCity API Client written in Swift

                              This is a _Work-In-Progress_ - with more endpoints coming soon.
                              This project is inspired by [TeamCitySharp](https://github.com/stack72/teamcitysharp).

                              See the [README](https://github.com/tombuildsstuff/swiftcity) for more info
                              ```
                             DESC
  s.homepage              = "https://github.com/tombuildsstuff/swiftcity"
  s.license               = "MIT"
  s.author                = "tombuildsstuff"
  s.social_media_url      = "http://twitter.com/tombuildsstuff"
  s.source                = { :git => "https://github.com/tombuildsstuff/swiftcity.git", :tag => "0.0.6" }
  s.source_files          = "SwiftCity", "SwiftCity/**/*.{h,swift}"
  s.exclude_files         = "SwiftCity/**/main.swift"
  s.framework             = "Foundation"
  s.ios.deployment_target = "8.0"
  s.requires_arc          = true

end
