//
//  UIHelper.swift
//  ASR
//
//  Created by Ara Hakobyan on 5/20/15.
//  Copyright (c) 2015 Arohak LLC. All rights reserved.
//

import SwiftLoader
import Alamofire

class UIHelper: NSObject {
    
    class func shakeWithView(view: UIView) {
        var shake:CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        var from_point:CGPoint = CGPointMake(view.center.x - 5, view.center.y)
        var from_value:NSValue = NSValue(CGPoint: from_point)
        
        var to_point:CGPoint = CGPointMake(view.center.x + 5, view.center.y)
        var to_value:NSValue = NSValue(CGPoint: to_point)
        
        shake.fromValue = from_value
        shake.toValue = to_value
        view.layer.addAnimation(shake, forKey: "position")
    }

    class func setTextFieldStyle(textField: UITextField) {
        textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder!, attributes: [NSForegroundColorAttributeName : UIColor.grayColor()])
        textField.backgroundColor = UIColor.lightTextColor()
        textField.font = SI_FIELD_FONT
        var paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        paddingView.backgroundColor = UIColor.clearColor()
        textField.leftView = paddingView;
        textField.leftViewMode = UITextFieldViewMode.Always
    }
    
    class func setButtonStyle(button: UIButton, title: String) {
        button.setTitle(title, forState: UIControlState.Normal)
        button.setTitleColor(WHITE, forState: UIControlState.Normal)
        button.backgroundColor = BLUE
        button.titleLabel?.font = SI_BUTTON_FONT
    }
    
    class func showLoader() {
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.spinnerColor = BLUE
        config.titleTextColor = BLUE
        
        SwiftLoader.setConfig(config)
        SwiftLoader.show(title: "Loading...", animated: true)
    }
    
    class func hideLoader() {
        SwiftLoader.hide()
    }
    
    class func showError(message: String) {
        var alert = UIAlertController(title: "Rails", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let navc: UINavigationController = appDelegate.window!.rootViewController as! UINavigationController
        navc.presentViewController(alert, animated: true, completion: nil)
    }
}
