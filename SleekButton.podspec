#
# Be sure to run `pod lib lint SleekButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SleekButton'
  s.version          = '0.1.0'
  s.summary          = 'SleekButton is a drop-in class replacing the boring default UIButton.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SleekButton is a drop-in class replacing the boring default UIButton.
You can easily configure styles for your button, including gradients, drop shadows
animatable titles, corner radius and more!
Sleek Button is completely compatible with UIButton and can be a drop-in replacement,
even mimicking just a default UIButton! Everything is optional.
DESC

  s.homepage         = 'https://github.com/MauriceArikoglu/'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'MauriceArikoglu' => 'development@mauricearikoglu.de' }
  s.source           = { :git => 'https://github.com/MauriceArikoglu/sleek-button.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SleekButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SleekButton' => ['SleekButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'

end
