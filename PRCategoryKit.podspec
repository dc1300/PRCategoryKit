
Pod::Spec.new do |s|
  s.name             = 'PRCategoryKit'
  s.version          = '72'
  s.summary          = 'A short description of PRCategoryKit.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/dc1300/PRCategoryKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dc1300' => 'dravendc@foxmail.com' }
  s.source           = { :git => 'https://github.com/dc1300/PRCategoryKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

    s.source_files = "PRCategoryKit/Classes/Header.h"
    s.public_header_files = "PRCategoryKit/Classes/Header.h"
    s.frameworks = "UIKit","Foundation"


s.subspec 'Category' do |ss|
    ss.source_files = "PRCategoryKit/Classes/Category/*","PRCategoryKit/Classes/Header.h"
    ss.public_header_files = "PRCategoryKit/Classes/Category/*.h","PRCategoryKit/Classes/Header.h"
    ss.frameworks = "UIKit","Foundation","QuartzCore","CoreText"
end

s.subspec 'SSKeychain' do |ss|
    ss.source_files = 'PRCategoryKit/Classes/SSKeychain/*'
    ss.frameworks = "Security"
end

s.subspec 'Tool' do |ss|
    ss.dependency 'PRCategoryKit/Category'
    ss.source_files = "PRCategoryKit/Classes/Tool/**/*"
    ss.public_header_files = "PRCategoryKit/Classes/Tool/**/*.h"
    ss.frameworks = "UIKit","Foundation","ImageIO","AVFoundation","QuartzCore"

    ss.subspec 'Appliance' do |ssta|
        ssta.dependency 'PRCategoryKit/Category'
        ssta.dependency 'PRCategoryKit/Tool/View'
        ssta.source_files = "PRCategoryKit/Classes/Tool/Appliance/**/*"
        ssta.public_header_files = "PRCategoryKit/Classes/Tool/Appliance/**/*.h"
        ssta.frameworks = "UIKit","Foundation","ImageIO","AVFoundation","QuartzCore"

        ssta.subspec 'NoticeCameraCategory' do |sstan|
            sstan.dependency 'PRCategoryKit/Category'
            sstan.source_files = "PRCategoryKit/Classes/Tool/Appliance/NoticeCameraCategory/*"
            sstan.public_header_files = "PRCategoryKit/Classes/Tool/Appliance/NoticeCameraCategory/*.h"
            sstan.frameworks = "UIKit","Foundation","ImageIO","AVFoundation","QuartzCore"
        end
    end
    ss.subspec 'View' do |ssta|
        ssta.dependency 'PRCategoryKit/Category'
        ssta.source_files = "PRCategoryKit/Classes/Tool/View/**/*"
        ssta.public_header_files = "PRCategoryKit/Classes/Tool/View/**/*.h"
        ssta.frameworks = "UIKit","Foundation","ImageIO","AVFoundation","QuartzCore"
    end

end




end
