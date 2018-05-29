
Pod::Spec.new do |s|
  s.name             = 'PRCategoryKit'
  s.version          = '5'
  s.summary          = 'A short description of PRCategoryKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dc1300/PRCategoryKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dc1300' => 'dravendc@foxmail.com' }
  s.source           = { :git => 'https://github.com/dc1300/PRCategoryKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

s.source_files = "PRCategoryKit/Classes/**/*.{h,m}"
s.public_header_files = "PRCategoryKit/Classes/*.h"
s.frameworks =  "UIKit"

s.subspec 'Category' do |category|
category.source_files = 'PRCategoryKit/Classes/Category/*'
#category.public_header_files = "PRCategoryKit/Classes/Category/*.h"
category.frameworks = "CommonCrypto","Foundation","objc","QuartzCore","UIKit","CoreText","sys"
end

s.subspec 'SSKeychain' do |sskeychain|
sskeychain.source_files = 'PRCategoryKit/Classes/SSKeychain/*'
#sskeychain.public_header_files = "PRCategoryKit/Classes/SSKeychain/*.h"
sskeychain.frameworks = "Security"
end

s.subspec 'Tool' do |tool|
tool.source_files = 'PRCategoryKit/Classes/Tool/*'
#tool.public_header_files = "PRCategoryKit/Classes/Tool/*.h"
#tool.dependency "Category"
tool.frameworks = "CommonCrypto","UIKit","QuartzCore","sys","AVFoundation","ImageIO","Foundation"
end


end
