<p align="center">
  <img src ="https://raw.githubusercontent.com/remirobert/Suitchi/master/README/Suitchi.png"/>
</p>

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)
[![Issues](https://img.shields.io/github/issues/nghialv/Transporter.svg?style=flat
)](https://github.com/remirobert/Suitchi/issues?state=open)

**Suitchi** is a custom switch for iOS written in swift. **Suitchi** is highly customizable, you can change almost all parts of this composant. It can display a label in the center of the switch to display some additional information. **Suitchi** handles gesture and simple click.

<p align="center">
  <img src ="https://raw.githubusercontent.com/remirobert/Suitchi/master/README/simple.gif"/>
</p>
<p align="center">
  Customize as you wish.
</p>
<p align="center">
  <img src ="https://raw.githubusercontent.com/remirobert/Suitchi/master/README/simple2.gif"/>
</p>

Installation
============
Cocoapods
```
pod 'Suitchi'
```

Or just copy the **Sources/Suitchi.swift** file in your project.

How it works ?
==============
To make your life easier and make your most beautiful and maintainable code, **Suitchi** uses blocks to retrieve the events.
```Swift
let genderSwitch = Suitchi(frame: CGRectMake(0, 0, 300, 100),
  onSwitchedBlock: { () -> () in
    println("On !")
  }) { () -> () in
    println("Off !")
}
```

Get the current state, or change it:
```Swift
if genderSwitch.on {
}

genderSwitch.switchOn()
genderSwitch.switchOff()
```

Some customisation:
```Swift
genderSwitch.offLabel = "Man"
genderSwitch.onLabel = "Woman"

genderSwitch.onColor = UIColor(red:1, green:0.15, blue:0.29, alpha:1)
genderSwitch.offColor =  UIColor(red:0.3, green:0.3, blue:0.82, alpha:1)

genderSwitch.centerText = "gender"
```

