#
# Be sure to run `pod lib lint sdlrkx.podspec' to ensure this is a
# valid spec before submitting.

Pod::Spec.new do |s|
  s.name             = "sdlrkx"
  s.version          = "0.3.1"
  s.summary          = "SDL visual self-report for ResearchKit"

  s.description      = "The Small Data Lab ResearchKit Extensions package is the easiest way to include SDL visual self-report (YADL, MEDL, PAM) into a ResearchKit application."

  s.homepage         = "https://github.com/cornelltech/sdl-rkx"
  s.license          = { :type => "Apache 2", :file => "LICENSE" }
  s.author           = { "James Kizer, Cornell Tech Foundry" => "jdk288 at cornell dot edu" }
  s.source           = { :git => "https://github.com/cornelltech/sdl-rkx.git", :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.subspec 'Helpers' do |helpers|
    helpers.source_files = 'source/Helpers/Classes/**/*'
  end

  s.subspec 'VSR' do |vsr|
    vsr.source_files = 'source/VSR/Core/Classes/**/*'
    vsr.dependency 'sdlrkx/Helpers'
    vsr.resources = 'source/VSR/Core/Assets/PAM.xcassets', 'source/VSR/Core/Assets/PAM.json'
    vsr.dependency 'ResearchKit', '~> 1.3.1'
  end

  s.subspec 'VSR-RSTBSupport' do |rstb|
    rstb.source_files = 'source/VSR/RSTBSupport/Classes/**/*'
    rstb.dependency 'sdlrkx/VSR'
    rstb.dependency 'ResearchSuiteTaskBuilder', '~> 0.2.0'
    rstb.dependency 'Gloss', '~> 1'
  end

  s.subspec 'Behavioral' do |behavioral|
    behavioral.source_files = 'source/Behavioral/Core/Classes/**/*'
    behavioral.dependency 'sdlrkx/Helpers'
    behavioral.resources = 'source/Behavioral/Core/Assets/BART/BART.xcassets'
    behavioral.dependency 'ResearchKit', '~> 1.3.1'
  end

  s.subspec 'Behavioral-RSTBSupport' do |rstb|
    rstb.source_files = 'source/Behavioral/RSTBSupport/Classes/**/*'
    rstb.dependency 'sdlrkx/Behavioral'
    rstb.dependency 'ResearchSuiteTaskBuilder', '~> 0.2.0'
    rstb.dependency 'Gloss', '~> 1'
  end

end