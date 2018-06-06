Pod::Spec.new do |s|
s.name             = 'PRCategoryKit'
s.version          = '83'
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
s.public_header_files = "PRCategoryKit/Classes/**/*.h"
s.frameworks = "UIKit","Foundation","QuartzCore","CoreText","ImageIO","AVFoundation","QuartzCore","Security","PRCategoryKit"


s.subspec 'Category' do |ss|
ss.source_files = "PRCategoryKit/Classes/Category/*.{h,m}"
ss.public_header_files = "PRCategoryKit/Classes/Category/*.h"
end

s.subspec 'SSKeychain' do |ssk|
ssk.source_files = 'PRCategoryKit/Classes/SSKeychain/*.{h,m}'
ssk.frameworks = "Security"
end

s.subspec 'Tool' do |sst|
sst.source_files = "PRCategoryKit/Classes/Tool/**/*.{h,m}"
sst.public_header_files = "PRCategoryKit/Classes/Tool/**/*.h"
sst.subspec 'Appliance' do |ssta|
ssta.source_files = "PRCategoryKit/Classes/Tool/Appliance/**/*.{h,m}"
ssta.public_header_files = "PRCategoryKit/Classes/Tool/Appliance/**/*.h"

ssta.subspec 'NoticeCameraCategory' do |sstan|
sstan.source_files = "PRCategoryKit/Classes/Tool/Appliance/NoticeCameraCategory/**/*.{h,m}"
sstan.public_header_files = "PRCategoryKit/Classes/Tool/Appliance/NoticeCameraCategory/**/*.h"
end
end
sst.subspec 'View' do |ssta|
ssta.source_files = "PRCategoryKit/Classes/Tool/View/**/*.{h,m}"
ssta.public_header_files = "PRCategoryKit/Classes/Tool/View/**/*.h"
end

end


end
