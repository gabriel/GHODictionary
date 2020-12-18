Pod::Spec.new do |s|

  s.name         = "GHODictionary"
  s.version      = "1.1.1"
  s.summary      = "Ordered dictionary."
  s.homepage     = "https://github.com/gabriel/GHODictionary"
  s.license      = { :type => "MIT" }
  s.author       = { "Gabriel Handford" => "gabrielh@gmail.com" }
  s.source       = { :git => "https://github.com/gabriel/GHODictionary.git", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = "GHODictionary/**/*.{c,h,m}"

  s.ios.deployment_target = "7.0"

  s.tvos.deployment_target = "10.0"

  s.osx.deployment_target = "10.8"

end
