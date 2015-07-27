#
# Be sure to run `pod lib lint Unko.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "RippleLayer"
  s.version          = "0.1.0"
  s.summary          = "Draw splash effect using CGPath."
  s.description      = <<-DESC
                        This provide CALayer subclass. Create a 2D wave splash animation.
                        more info at: [https://github.com/hadashiA/RippleLayer](https://github.com/hadashiA/RippleLayer)
                       DESC
  s.homepage         = "https://github.com/hadashiA/RippleLayer"
  s.screenshots      = "https://raw.githubusercontent.com/hadashiA/RippleLayer/master/sample_default.gif"
  s.license          = 'MIT'
  s.author           = { "hadashiA" => "dev@hadashikick.jp" }
  s.source           = { :git => "https://github.com/hadashiA/RippleLayer.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/hadashiA'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Sources/**/*'
  # s.resource_bundles = {}
  s.frameworks = 'UIKit'
end
