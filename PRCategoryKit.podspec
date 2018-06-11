Pod::Spec.new do |s|
s.name             = 'PRCategoryKit'
s.version          = '92'
s.summary          = '金融村公共类'

s.description      = <<-DESC
TODO: Add long description of the pod here.
DESC

s.homepage         = 'https://github.com/dc1300/PRCategoryKit'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'dc1300' => 'dravendc@foxmail.com' }
s.source           = { :git => 'https://github.com/dc1300/PRCategoryKit.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'

s.static_framework  =  true
s.requires_arc   = true
s.source_files = "PRCategoryKit/Classes/**/*.{h,m}"
s.public_header_files = "PRCategoryKit/Classes/**/*.h"
s.frameworks = 'UIKit','Foundation','QuartzCore','ImageIO','SystemConfiguration','Security','CoreTelephony','CoreText','CoreGraphics','AssetsLibrary','CFNetwork','AVFoundation','QuartzCore','Photos'

s.libraries = 'iconv','sqlite3','stdc++','z'

  s.ios.vendored_frameworks = 'PRCategoryKit/Classes/QQSDK/TencentOpenAPI.framework'
#s.ios.vendored_framework = 'PRCategoryKit/QQSDK/TencentOpenAPI.framework'
s.ios.vendored_libraries = 'PRCategoryKit/Classes/WeiboSDK/libWeiboSDK.a','PRCategoryKit/Classes/WeChatSDK/libWeChatSDK.a'


  s.resource_bundles = {
        'PRCategoryKit' => ['PRCategoryKit/Classes/QQSDK/TencentOpenApi_IOS_Bundle.bundle'],
     'WeiboSDKBundle' => ['PRCategoryKit/Classes/WeiboSDK/WeiboSDK.bundle']
   }


end
