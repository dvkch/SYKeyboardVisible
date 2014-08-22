Pod::Spec.new do |s|
  s.name     = 'SYKeyboardVisible'
  s.version  = '1.0'
  s.license  = 'Custom, see Readme.md'
  s.summary  = 'Singleton to determine if the keyboard is currently visible'
  s.homepage = 'https://github.com/dvkch/SYKeyboardVisible'
  s.author   = { 'Stan Chevallier' => 'contact@stanislaschevallier.fr' }
  s.source   = { :git => 'https://github.com/dvkch/SYKeyboardVisible.git' }
  s.source_files = 'SYKeyboardVisible/SYKeyboardVisible.{h,m}'
  s.requires_arc = true

  s.xcconfig = { 'CLANG_MODULES_AUTOLINK' => 'YES' }
  s.ios.deployment_target = '5.0'
end
