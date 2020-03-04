Pod::Spec.new do |s|
  s.name         = 'WXNavigationBar'
  s.version      = '1.8.1'
  s.license = 'MIT'
  s.requires_arc = true
  s.source = { :git => 'https://github.com/alexiscn/WXNavigationBar.git', :tag => s.version.to_s }

  s.summary         = 'WeChat NavigationBar'
  s.homepage        = 'https://github.com/alexiscn/WXNavigationBar'
  s.license         = { :type => 'MIT' }
  s.author          = { 'xushuifeng' => 'shuifengxu@gmail.com' }
  s.platform        = :ios
  s.swift_version   = '5.0'
  s.source_files    =  'Sources/**/*.{swift}'
  s.ios.deployment_target = '12.0'
  
end
