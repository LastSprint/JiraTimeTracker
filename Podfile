# Uncomment the next line to define a global platform for your project

platform :ios, '11.0'

def utils
  pod 'SwiftGen', '~> 6.1.0'
  pod 'SwiftLint', '~> 0.30.1'
  pod 'Pecker'
end

def common 
  pod 'PluggableApplicationDelegate', :git => "https://github.com/surfstudio/PluggableApplicationDelegate.git", :commit=>"b24aabe3f34d51072cee5cac3b576dbb1f4ca9ec"
  pod 'ReactiveDataDisplayManager', :git=> "https://github.com/surfstudio/ReactiveDataDisplayManager", :tag=>"5.0.1"
  pod 'NodeKit', :git => "https://github.com/surfstudio/NodeKit.git", :tag=>"3.2.0"
  pod 'CryptoSwift', :git => 'https://github.com/krzyzanowskim/CryptoSwift', :tag => '1.3.1'
  pod 'SwiftMessages', '~> 7.0.1'
end

def surf_utils
  $SurfUtils = "https://github.com/surfstudio/iOS-Utils.git"
  $Tag = "10.0.5"
  pod 'SurfUtils/StringAttributes', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/KeyboardPresentable', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/UIStyle', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/XibView', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/SkeletonView', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/CommonButton', :git => $SurfUtils, :tag => $Tag
  pod 'SurfUtils/VibrationFeedbackManager', :git => $SurfUtils, :tag => $Tag
end

def ui_pods
  pod 'SFOTPTextField', '~> 1.0.0'
  pod 'TextFieldsCatalog', '~> 0.9.1'
end

def all
  utils
  common
  surf_utils
  ui_pods
end

target 'JiraTimeTracker' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  all

  # Pods for JiraTimeTracker

  target 'JiraTimeTrackerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'JiraTimeTrackerUITests' do
    # Pods for testing
  end

end
platform :ios, '11.0'

inhibit_all_warnings!

def utils
    pod 'SwiftGen', '~> 6.1.0'
    pod 'SwiftLint', '~> 0.30.1'
    pod 'CSTObfuscator'
end

def common_pods
    utils

    pod 'Firebase/Core'

    pod 'PluggableApplicationDelegate', :git => "https://github.com/surfstudio/PluggableApplicationDelegate.git", :commit=>"b24aabe3f34d51072cee5cac3b576dbb1f4ca9ec"
    pod 'ReactiveDataDisplayManager', :git=>"https://github.com/surfstudio/ReactiveDataDisplayManager", :tag=>"5.0.1"
    pod 'SurfUtils/StringAttributes', :git => "https://github.com/surfstudio/iOS-Utils.git", :tag => "10.0.5"
    pod 'NodeKit', :git => "https://github.com/surfstudio/NodeKit.git", :tag=>"3.2.0"
end


target 'JiraTimeTrackerDebug' do
	use_frameworks!
	common_pods
end


target 'JiraTimeTrackerRelease' do
	use_frameworks!
	common_pods
end
