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
To make your life easier and make your most beautiful and maintainable code, suitchi uses blocks to retrieve the events.
```Swift
let genderSwitch = Suitchi(frame: CGRectMake(0, 0, 300, 100),
  onSwitchedBlock: { () -> () in
    println("On !")
  }) { () -> () in
    println("Off !")
}
```
