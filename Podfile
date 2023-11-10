# Uncomment the next line to define a global platform for your project

platform :ios, '16.0'

target 'Expense Tracker' do

  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

# Pods for Expense Tracker
# pod 'SwiftLint'
pod 'FSCalendar'
pod 'SnapKit'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
            end
        end
    end
end

end
