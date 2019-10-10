Pod::Spec.new do |s|
  s.name     = 'WikiUIs'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.platform = :ios
  s.summary  = 'A drop-in universal solution for Different UI components.'
  s.homepage = 'https://github.com/iosdeveloper480/Wiki_UIs'
  s.author   = { 'Wiki Ali' => 'waqasaliw@gmail.com' }
  s.source   = { :git => 'https://github.com/iosdeveloper480/Wiki_UIs.git', :tag => '0.0.1' }

  s.description = "This is custom UI components classes with @IBDesignable features." 

  s.source_files = 'Wiki_UIs/*.{swift}'
  s.requires_arc = false
end