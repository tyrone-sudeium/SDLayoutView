Pod::Spec.new do |s|
  s.name         = "SDLayoutView"
  s.version      = '1.0.0'
  s.license      = 'MIT'
  s.summary      = "Pre-calculating automatic layout views."
  s.homepage     = "https://github.com/tyrone-sudeium/SDLayoutView"
  s.author       = { "Tyrone Trevorrow" => "tyrone@sudeium.com" }
  s.source       = { :git => "https://github.com/tyrone-sudeium/SDLayoutView.git", :tag => "#{s.version}" }
  s.ios.deployment_target = '5.0'
  s.source_files = 'SDLayoutView/*.{h,m}', 'SDLayoutView/NibLoaded/*.{h,m}'
  s.requires_arc = true
end
