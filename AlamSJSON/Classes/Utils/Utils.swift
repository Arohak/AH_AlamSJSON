//
//  Utils.swift
//  ASR
//
//  Created by Ara Hakobyan on 5/20/15.
//  Copyright (c) 2015 Arohak LLC. All rights reserved.
//

import CoreData

class Utils: NSObject {
    
    class func isValidTextField(field: UITextField) -> Bool {
        var isValid = false
        let kText = field.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        !(kText == "") ? isValid = true : UIHelper.shakeWithView(field)
        
        return isValid;
    }
    
    class func isValidEmail(field: UITextField) -> Bool {
        var isValid = false
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let email = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        email.evaluateWithObject(field.text) ? isValid = true : UIHelper.shakeWithView(field)
        
        return isValid
    }
    
    class func isValidPasswords(fieldOne: UITextField, fieldTwo: UITextField) -> Bool {
        var isValid = false
        let kPassword = fieldOne.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let kComPassword = fieldTwo.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        if (kPassword == kComPassword && kPassword != "" && kComPassword != "" && count(kPassword) > 3) {
            isValid = true
        } else {
            UIHelper.shakeWithView(fieldOne)
            UIHelper.shakeWithView(fieldTwo)
        }
        
        return isValid;
    }
    
    class func stringToDate(dateString: String) -> NSDate? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        var date : NSDate = dateFormatter.dateFromString(dateString)!
        
        return date
    }
    
    class func stringConvertToStringDate(dateString: String) -> String? {
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeZone = NSTimeZone.defaultTimeZone()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = "yyyyMMdd'T'HHmmss.SSSZ"
        
        var date = dateFormatter.dateFromString(dateString)
        dateFormatter.dateFormat = "dd-MMM-yyyy"
        if date != nil {
            return dateFormatter.stringFromDate(date!)
        } else {
            return ""
        }
    }
    
    class func dateToString(date: NSDate) -> String {
        var dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US")
        dateFormatter.dateFormat = "dd-MMM-YYYY"
        return dateFormatter.stringFromDate(date)
    }
}
