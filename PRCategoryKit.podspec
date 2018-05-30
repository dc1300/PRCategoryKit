
Pod::Spec.new do |s|
  s.name             = 'PRCategoryKit'
  s.version          = '49'
  s.summary          = 'A short description of PRCategoryKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dc1300/PRCategoryKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dc1300' => 'dravendc@foxmail.com' }
  s.source           = { :git => 'https://github.com/dc1300/PRCategoryKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

    s.source_files = "PRCategoryKit/Classes/**/*"
    s.public_header_files = "PRCategoryKit/Classes/Header.h","PRCategoryKit/Classes/**/*.h"
    s.frameworks = "UIKit","Foundation"

s.subspec 'Category' do |category|
    category.source_files = 'PRCategoryKit/Classes/Category/*'
    category.public_header_files = "PRCategoryKit/Classes/Category/*.h","PRCategoryKit/Classes/Header.h"

category.xcconfig = {"HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/CommonCrypto" "$(SDKROOT)/usr/include/objc"  "$(SDKROOT)/usr/include/sys"}
    category.frameworks = "UIKit","Foundation","QuartzCore","CoreText"
end

s.subspec 'SSKeychain' do |sskeychain|
    sskeychain.source_files = 'PRCategoryKit/Classes/SSKeychain/*'
    sskeychain.frameworks = "Security"
end




end
