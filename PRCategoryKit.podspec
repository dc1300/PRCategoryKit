#
# Be sure to run `pod lib lint PRCategoryKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PRCategoryKit'
  s.version          = '3'
  s.summary          = 'A short description of PRCategoryKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dc1300/PRCategoryKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dc1300' => 'dravendc@foxmail.com' }
  s.source           = { :git => 'https://github.com/dc1300/PRCategoryKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#  s.source_files = 'PRCategoryKit/Classes/**/*'
s.source_files = "PRCategoryKit/Classes/*.{h,m}"
s.public_header_files = "PRCategoryKit/Classes/*.h"

s.subspec 'Category' do |category|
category.source_files = 'PRCategoryKit/Classes/Category/*'
category.public_header_files = "PRCategoryKit/Classes/Category/*.h"
end

s.subspec 'SSKeychain' do |sskeychain|
sskeychain.source_files = 'PRCategoryKit/Classes/SSKeychain/*'
sskeychain.public_header_files = "PRCategoryKit/Classes/SSKeychain/*.h"
end

s.subspec 'Tools' do |tools|
tools.source_files = 'PRCategoryKit/Classes/Tools/*'
tools.public_header_files = "PRCategoryKit/Classes/Tools/*.h"
end

s.subspec 'WXWTools' do |wxwtools|
wxwtools.source_files = 'PRCategoryKit/Classes/WXWTools/*'
wxwtools.public_header_files = "PRCategoryKit/Classes/WXWTools/*.h"
end

  # s.resource_bundles = {
  #   'PRCategoryKit' => ['PRCategoryKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
s.frameworks =  "UIKit"
end
