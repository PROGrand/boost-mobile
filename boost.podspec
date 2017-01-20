#
#  Be sure to run `pod spec lint boost.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "boost"
  s.version      = "1.63.0"
  s.summary      = "boost 1.63.0"

  s.author             = "Vladimir E. Koltunov"
  s.platform     = :ios

  s.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => "BOOST_THREAD_VERSION=4 BOOST_SYSTEM_NO_DEPRECATED BOOST_THREAD_PROVIDES_CONDITION BOOST_THREAD_PROVIDES_NESTED_LOCKS BOOST_THREAD_PROVIDES_FUTURE BOOST_THREAD_PROVIDES_FUTURE_CONTINUATION BOOST_THREAD_PROVIDES_EXECUTORS" }

  s.homepage     = "https://github.com/boostorg/boost"

  s.source = { :git => "https://github.com/boostorg/boost.git", :tag => "boost-1.63.0"}

  s.ios.vendored_frameworks = "ios/framework/boost.framework"
end
