//
//  Suitchi.swift
//  Custom Switch
//
//  Created by Remi Robert on 26/03/15.
//  Copyright (c) 2015 Remi Robert. All rights reserved.
//

import UIKit

//Suitchi

class Suitchi: UIView, UIGestureRecognizerDelegate {

    //MARK: -
    //MARK: public propreties
    
    var on: Bool = true
    var completionOn: (() -> ())!
    var completionOff: (() -> ())!
    
    /// Label text on the on state.
    var onLabel: String! {
        didSet {
            self.onButton.activeLabel.text = self.onLabel
            self.onButton.inactiveLabel.text = self.onLabel
        }
    }
    
    /// Label text off the on state.
    var offLabel: String! {
        didSet {
            self.offButton.activeLabel.text = self.offLabel
            self.offButton.inactiveLabel.text = self.offLabel
        }
    }
    
    /// The background color of Suitchi.
    var colorBackground: UIColor! {
        didSet {
            self.contentView.backgroundColor = self.colorBackground
        }
    }
    
    /// Color on the on state.
    var onColor: UIColor! {
        didSet {
            if (self.on) {
                self.sliderWindow.backgroundColor = self.onColor
                self.onButton.inactiveLabel.textColor = self.onColor
            }
        }
    }
    
    /// Color on the off state.
    var offColor: UIColor! {
        didSet {
            if (!self.on) {
                self.sliderWindow.backgroundColor = self.offColor
                self.offButton.inactiveLabel.textColor = self.offColor
            }
        }
    }
    
    /// Color for all state, overload onColor and offColor.
    var sliderColor: UIColor! {
        didSet {
            self.onColor = self.sliderColor
            self.offColor = self.sliderColor
        }
    }
    
    /// Center text for indication in the center of Suitchi.
    var centerText: String! {
        didSet {
            self.addSubview(self.centerViewLabel)
            self.centerViewLabel.text = self.centerText
            //self.centerViewLabel.resizeContainer()
            self.centerViewLabel.center = self.contentView.center
        }
    }
    
    //MARK: -
    //MARK: private propreties
    
    private lazy var centerViewLabel: CustomCenterLabel! = {
        let centerView = CustomCenterLabel(text: self.centerText)
        return centerView
    }()
    
    private lazy var centerLabel: UILabel! = {
        let label = UILabel()
        label.text = self.centerText
        label.font = UIFont.systemFontOfSize(11)
        label.textAlignment = NSTextAlignment.Center
        return label
    }()
    
    private lazy var onButton: customSwitchButton! = {
        let onButton = customSwitchButton(frame: CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height), label: self.onLabel)
        onButton.enabled = false
        onButton.backgroundColor = UIColor.clearColor()
        onButton.inactiveLabel.alpha = 0.0
        onButton.activeLabel.text = self.onLabel
        onButton.inactiveLabel.text = self.onLabel
        onButton.activeLabel.textColor = UIColor.whiteColor()
        onButton.inactiveLabel.textColor = self.onColor
        onButton.addTarget(self, action: "switchOn", forControlEvents: UIControlEvents.TouchUpInside)
        return onButton
    }()
    
    private lazy var offButton: customSwitchButton! = {
        let offButton = customSwitchButton(frame: CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width / 2, self.frame.size.height), label: self.offLabel)
        offButton.activeLabel.text = self.offLabel
        offButton.inactiveLabel.text = self.offLabel
        offButton.activeLabel.textColor = UIColor.whiteColor()
        offButton.inactiveLabel.textColor = self.offColor
        offButton.enabled = true
        offButton.backgroundColor = UIColor.clearColor()
        offButton.addTarget(self, action: "switchOff", forControlEvents: UIControlEvents.TouchUpInside)
        return offButton
    }()
    
    private lazy var sliderWindow: UIView! = {
        let slider = UIView()
        slider.backgroundColor = UIColor(red:0.22, green:0.22, blue:0.22, alpha:1)
        slider.frame = CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height)
        slider.layer.cornerRadius = 4.0
        return slider
    }()
    
    private lazy var contentView: UIView! = {
        let centerView = UIView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        centerView.layer.cornerRadius = 4
        centerView.backgroundColor = UIColor.whiteColor()
        return centerView
    }()
    
    //MARK: -
    //MARK: Custom private class
    
    //MARK: CustomCenterLabel Custom class
    private class CustomCenterLabel: UIView {
        var text: String! {
            didSet {
                self.centerLabel.text = text
                self.addSubview(centerLabel)
            }
        }
        
        func resizeContainer() {
            self.centerLabel.sizeToFit()
            centerLabel.font = UIFont.systemFontOfSize(10)
            centerLabel.textAlignment = NSTextAlignment.Center
            self.centerLabel.frame.size.width += 4
            self.centerLabel.textColor = UIColor.grayColor()
            self.centerLabel.layer.cornerRadius = centerLabel.frame.size.height / 2
            self.frame.size = CGSizeMake(self.centerLabel.frame.size.width, self.frame.size.height)
            self.layer.cornerRadius = self.centerLabel.frame.size.height / 2
        }
        
        lazy var centerLabel: UILabel! = {
            let centerLabel = UILabel()
            centerLabel.text = self.text
            centerLabel.sizeToFit()
            centerLabel.font = UIFont.systemFontOfSize(10)
            centerLabel.textAlignment = NSTextAlignment.Center
            centerLabel.frame.size.width += 4
            centerLabel.textColor = UIColor.grayColor()
            centerLabel.layer.cornerRadius = centerLabel.frame.size.height / 2
            return centerLabel
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        init(text: String) {
            super.init()
            
            self.text = text
            self.frame.size = CGSizeMake(self.centerLabel.frame.size.width, self.centerLabel.frame.size.height)
            self.addSubview(self.centerLabel)
            self.layer.cornerRadius = self.centerLabel.frame.size.height / 2
            self.backgroundColor = UIColor.whiteColor()
        }

        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    //MARK: customSwitchButton Custom class
    private class customSwitchButton: UIButton {
        lazy var activeLabel: UILabel = {
            let activeLabel = UILabel()
            activeLabel.frame.origin = CGPointZero
            activeLabel.frame.size = self.frame.size
            activeLabel.alpha = 1.0
            activeLabel.textAlignment = NSTextAlignment.Center
            return activeLabel
        }()
        
        lazy var inactiveLabel: UILabel = {
            let inactiveLabel = UILabel()
            inactiveLabel.frame.origin = CGPointZero
            inactiveLabel.frame.size = self.frame.size
            inactiveLabel.alpha = 1.0
            inactiveLabel.textAlignment = NSTextAlignment.Center
            return inactiveLabel
        }()
        
        override func drawRect(rect: CGRect) {
            self.addSubview(self.activeLabel)
            self.addSubview(self.inactiveLabel)
        }
        
        init(frame: CGRect, label: String) {
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
        }

        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    //MARK: -
    //MARK: State method:
    func switchOn() {
        if (self.on) {
            return
        }
        self.on = true
        UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            
            UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 14.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                
                self.sliderWindow.frame.origin.x -= self.frame.size.width / 2
                
                }, completion: nil)
            
            self.sliderWindow.backgroundColor = self.onColor
            self.onButton.activeLabel.alpha = 1.0
            self.onButton.inactiveLabel.alpha = 0.0
            self.offButton.activeLabel.alpha = 0.0
            self.offButton.inactiveLabel.alpha = 1.0
            
            self.onButton.enabled = false
            self.offButton.enabled = true
            
            }) { (anim: Bool) -> Void in
                self.completionOn()
        }
    }
    
    func switchOff() {
        if (!self.on) {
            return
        }
        self.on = false
        UIView.animateWithDuration(0.4, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            
            UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 14.0, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                
                self.sliderWindow.frame.origin.x += self.frame.size.width / 2
                
                }, completion: nil)
                        
            self.sliderWindow.backgroundColor = self.offColor
            self.onButton.activeLabel.alpha = 0.0
            self.onButton.inactiveLabel.alpha = 1.0
            self.offButton.activeLabel.alpha = 1.0
            self.offButton.inactiveLabel.alpha = 0.0
            
            self.onButton.enabled = true
            self.offButton.enabled = false
            
            }){ (anim: Bool) -> Void in
              self.completionOff()
        }
    }
    
    override func drawRect(rect: CGRect) {
        self.backgroundColor = UIColor.whiteColor()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4
        self.onButton.frame = CGRectMake(0, 0, rect.size.width / 2, rect.size.height)
        self.offButton.frame = CGRectMake(rect.size.width / 2, 0, rect.size.width / 2, rect.size.height)
        
        self.addSubview(self.contentView)
        self.contentView.addSubview(sliderWindow)
        self.contentView.addSubview(onButton)
        self.contentView.addSubview(offButton)
        
        let recogniserRight = UISwipeGestureRecognizer(target: self, action: "swipeGesture:")
        recogniserRight.direction = UISwipeGestureRecognizerDirection.Right
        recogniserRight.delegate = self
        
        let recogniserLeft = UISwipeGestureRecognizer(target: self, action: "swipeGesture:")
        recogniserLeft.direction = UISwipeGestureRecognizerDirection.Left
        recogniserLeft.delegate = self

        self.sliderWindow.addGestureRecognizer(recogniserRight)
        self.sliderWindow.addGestureRecognizer(recogniserLeft)
        
        let centerView = UIView()
        centerView.backgroundColor = UIColor.whiteColor()
        
        self.bringSubviewToFront(self.centerViewLabel)
    }
    
    func swipeGesture(sender: UISwipeGestureRecognizer) {
        if (sender.direction == UISwipeGestureRecognizerDirection.Left) {
            self.switchOn()
        }
        else {
            self.switchOff()
        }
    }
    
    //MARK: -
    //MARK: init method
    
    private func initDefault() {
        self.contentView.backgroundColor = UIColor.whiteColor()
        self.onLabel = "ON"
        self.offLabel = "OFF"
        self.sliderColor = UIColor(red:0.22, green:0.22, blue:0.22, alpha:1)
    }
    
    //MARK: constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initDefault()
    }
    
    init(frame: CGRect, onSwitchedBlock completionOn: () -> (), offSwitchedBlock completionOff: () -> ()) {
        super.init(frame: frame)
        self.initDefault()
        self.completionOn = completionOn
        self.completionOff = completionOff
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}