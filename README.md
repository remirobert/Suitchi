<p align="center">
  <img src ="https://raw.githubusercontent.com/remirobert/Suitchi/master/README/Suitchi.png"/>
</p>
**Suitchi** is a custom switch for iOS written in swift. **Suitchi** is highly customizable, you can change almost all parts of this composant. It can display a label in the center of the switch to display some additional information. **Suitchi** handles gesture and simple click.

<p align="center">
  <img src ="https://raw.githubusercontent.com/remirobert/Suitchi/master/README/simple.gif"/>
</p>

Customize as you wish.
<p align="center">
  <img src ="https://raw.githubusercontent.com/remirobert/Suitchi/master/README/simple2.gif"/>
</p>

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

