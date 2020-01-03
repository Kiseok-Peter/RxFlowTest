# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

target 'RxFlowTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  
  # Pods for RxFlowTest
  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  
  pod 'RxFlow'
  pod 'Moya/RxSwift'
  pod 'RxOptional'
  
  # Network
  pod 'Moya'
  pod 'Sniffer'
  
  # Image
  
  # Ui
  pod 'Texture'
  
  # Parse
  pod 'ObjectMapper'
  
  # Etc
  pod 'SwiftLint'
  
  # FireBase
  
  # Localize
  
  swift_4_1_targets = []
  
  post_install do |installer|
    print "Setting the default SWIFT_VERSION to 4.2\n"
    installer.pods_project.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
    
    installer.pods_project.targets.each do |target|
      if swift_4_1_targets.include? "#{target}"
        print "Setting #{target}'s SWIFT_VERSION to 4.1\n"
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '3.3'
        end
        else
        print "Setting #{target}'s SWIFT_VERSION to Undefined (Xcode will automatically resolve)\n"
        target.build_configurations.each do |config|
          config.build_settings.delete('SWIFT_VERSION')
          config.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
        end
      end
    end
  end
end


