## Using boost 1.63.0 on iOS

* ensure xcode, command line tools and cocoapods are installed.
* clone and cd to /path/to/boost_1_63_0.
* run boost.sh, ios/framework/boost.framework should be created.
* create test project and workspace.
* add Podfile to your test project, run pod install.
* try sample code from AppDelegate.mm (mm - because boost is c++ library).


