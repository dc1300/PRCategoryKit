
Pod::Spec.new do |s|
  s.name             = 'PRCategoryKit'
  s.version          = '55'
  s.summary          = 'A short description of PRCategoryKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dc1300/PRCategoryKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dc1300' => 'dravendc@foxmail.com' }
  s.source           = { :git => 'https://github.com/dc1300/PRCategoryKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

    s.source_files = "PRCategoryKit/Classes/**/*","PRCategoryKit/Classes/*.h"
    s.public_header_files = "PRCategoryKit/Classes/*.h"
    s.frameworks = "UIKit","Foundation"

s.subspec 'Category' do |category|
    category.source_files = 'PRCategoryKit/Classes/Category/*.{h,m}','PRCategoryKit/Classes/*.h'
    category.public_header_files = "PRCategoryKit/Classes/Category/*.h","PRCategoryKit/Classes/Header.h"
    category.frameworks = "UIKit","Foundation","QuartzCore","CoreText"
end

s.subspec 'SSKeychain' do |sskeychain|
    sskeychain.source_files = 'PRCategoryKit/Classes/SSKeychain/*'
    sskeychain.frameworks = "Security"
end

s.subspec 'Tool' do |tool|
tool.source_files = 'PRCategoryKit/Classes/Tool/**/*'
    tool.dependency 'PRCategoryKit/Category'
    tool.public_header_files = "PRCategoryKit/Classes/Tool/**/*.h"
    tool.frameworks = "UIKit","Foundation","ImageIO","AVFoundation","QuartzCore"
end




end
