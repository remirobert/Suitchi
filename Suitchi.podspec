#
#  Be sure to run `pod spec lint Suitchi.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Suitchi"
  s.version      = "1.0.0"
  s.summary      = "Custom Switch for iOS."

  s.description  = <<-DESC
  Suitchi is a custom switch for iOS written in swift.
   Suitchi is highly customizable, you can change almost all parts of this composant.
    It can display a label in the center of the switch to display some additional information.
     Suitchi handles gesture and simple click.
                   DESC

  s.homepage     = "https://github.com/remirobert/Suitchi"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  s.author             = { "remirobert" => "remirobert33530@gmail.com" }
  # Or just: s.author    = "remirobert"
  # s.authors            = { "remirobert" => "remirobert33530@gmail.com" }
  # s.social_media_url   = "http://twitter.com/remirobert"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/remirobert/Suitchi.git", :tag => "1.0.0" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any h, m, mm, c & cpp files. For header
  #  files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "Sources/Suitchi.swift"

end
