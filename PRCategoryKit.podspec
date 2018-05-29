
Pod::Spec.new do |s|
  s.name             = 'PRCategoryKit'
  s.version          = '16'
  s.summary          = 'A short description of PRCategoryKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dc1300/PRCategoryKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dc1300' => 'dravendc@foxmail.com' }
  s.source           = { :git => 'https://github.com/dc1300/PRCategoryKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

s.source_files = 'PRCategoryKit/Classes/*.{h,m}'
s.public_header_files = 'PRCategoryKit/Classes/*.h'
s.frameworks =  "UIKit"

s.subspec 'Category' do |category|
category.source_files = 'PRCategoryKit/Classes/Category/*'
#category.public_header_files = 'objc/runtime.h','sys/sysctl.h','sys/types.h','CommonCrypto/CommonDigest.h','sys/param.h','sys/mount.h'
#category.frameworks = "CommonCrypto","Foundation","objc","QuartzCore","UIKit","CoreText","sys"
category.frameworks = "UIKit","Foundation","QuartzCore","CoreText"
#,"CommonCrypto","objc","sys"
end

s.subspec 'SSKeychain' do |sskeychain|
sskeychain.source_files = 'PRCategoryKit/Classes/SSKeychain/*'
sskeychain.frameworks = "Security"
end

s.subspec 'Tool' do |tool|
tool.source_files = 'PRCategoryKit/Classes/Tool/*'
tool.dependency "Category"
tool.frameworks = "UIKit","Foundation","ImageIO","AVFoundation","QuartzCore"

end


end
