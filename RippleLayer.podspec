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
  s.summary          = "A short description of Unko."
  s.description      = <<-DESC
                       An optional longer description of Unko

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/hadashiA/RippleLayer"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "hadashiA" => "dev@hadashikick.jp" }
  s.source           = { :git => "https://github.com/hadashiA/RippleLayer.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'RippleLayer' => ['Pod/Assets/*.png']
  }
  s.frameworks = 'UIKit'
end
