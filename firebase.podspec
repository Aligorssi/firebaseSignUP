#
# Be sure to run `pod lib lint firebase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'firebase'
  s.version          = '0.1.0'
  s.summary          = 'This is base for firebase sigup using phone number.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here. This is base for firebase sigup using phone number.
                       DESC

  s.homepage         = 'https://github.com/aligorssi/firebaseSignUP'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aligorssi' => 'ali.gorssi@gmail.com' }
  s.source           = { :git => 'https://github.com/aligorssi/firebaseSignUP.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.0'
  s.static_framework = true
  
  #new text

  s.source_files = 'firebase/Classes/**/*'
  
  # s.resource_bundles = {
  #   'firebase' => ['firebase/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
  s.frameworks = 'UIKit'
  s.dependency 'Firebase/Core'
  s.dependency 'Firebase/Database'
  s.dependency 'Firebase/Firestore'
  s.dependency 'Firebase/Auth'
  
end
