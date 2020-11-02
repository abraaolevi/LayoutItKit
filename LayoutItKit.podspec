Pod::Spec.new do |s|
  s.name                      = "LayoutItKit"
  s.version                   = "0.1.0"
  s.summary                   = "LayoutItKit"
  s.homepage                  = "https://github.com/abraaolevi/LayoutItKit"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Abraão Levi" => "abr4ao.levi@gmail.com" }
  s.source                    = { :git => "https://github.com/abraaolevi/LayoutItKit.git", :tag => s.version.to_s }
  s.swift_version             = "5.3"
  s.ios.deployment_target     = "11.0"
  s.source_files              = "Sources/**/*"
  s.frameworks                = "Foundation"
end
