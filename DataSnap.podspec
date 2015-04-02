#
# Be sure to run `pod lib lint DataSnap.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DataSnap"
  s.version          = "0.0.4"
# better wording needed
  s.summary          = "DataSnap Location Based Analytics"
# better wording needed
  s.description      = <<-DESC
    DataSnap.io Location Based Analytics
                       DESC
  s.homepage         = "https://github.com/brianofearain/datasnap-ios"
# clarify license
  s.license          = 'MIT'
# change to Datasnap
  s.author           = { "brianofearain" => "brianjferan@gmail.com" }
  s.source           = { :git => "https://github.com/datasnap-io/datasnap-ios-generic-sample.git", :tag => s.version.to_s}
# test for other platforms
  s.platform     = :ios, '8.0'
  s.requires_arc = true

s.source_files = 'Classes'

# tidy to expose less
s.public_header_files = ['DataSnap/DSIOClient.h', 'DataSnap/DSIOConfig.h', 'DataSnap/DSIOProperties.h', 'DataSnap/DSIOSampleData.h', 'DataSnap/DSIOEvents.h']
  s.frameworks = 'UIKit', 'CoreTelephony', 'CoreLocation', 'CoreBluetooth'
  # s.dependency 'AFNetworking', '~> 2.3'
end
