
Pod::Spec.new do |s|
  s.name             = 'PRCategoryKit'
  s.version          = '86'
  s.summary          = 'A short description of PRCategoryKit.'
  s.description      = <<-DESC
                        通用类
                       DESC

  s.homepage         = 'https://github.com/dc1300/PRCategoryKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dc1300' => 'dravendc@foxmail.com' }
  s.source           = { :git => 'https://github.com/dc1300/PRCategoryKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

    s.requires_arc          = true
    s.ios.source_files = "PRCategoryKit/Classes/**/*.{h,m}"
    s.ios.public_header_files = "PRCategoryKit/Classes/*.h"
    s.ios.frameworks = 'UIKit','QuartzCore','ImageIO','SystemConfiguration','Security','CoreTelephony','CoreText','CoreGraphics','Foundation','AssetsLibrary','CFNetwork'
#s.resource                = 'PRCategoryKit/QQSDK/TencentOpenApi_IOS_Bundle.bundle'
s.ios.vendored_frameworks = 'PRCategoryKit/Classes/QQSDK/TencentOpenAPI.framework'
s.ios.vendored_library    = 'PRCategoryKit/Classes/WeiboSDK/libWeiboSDK.a','PRCategoryKit/Classes/WeChatSDK/libWeChatSDK.a'
s.libraries = 'iconv','sqlite3','stdc++','z'
s.resource_bundles = {
'PRCategoryKit' => ['PRCategoryKit/Classes/QQSDK/TencentOpenApi_IOS_Bundle.bundle']
}
s.static_framework  =  true


end
