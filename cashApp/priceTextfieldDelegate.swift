//
//  priceTextfieldDelegate.swift
//  cashApp
//
//  Created by Nikki L on 9/26/16.
//  Copyright © 2016 Nikki. All rights reserved.
//

import Foundation
import UIKit

class priceTextfieldDelegate : NSObject, UITextFieldDelegate {
    // when user starts typing, do something with the text
    // Cash text field. A dollar sign field that begins with the text $0.00, and then fills in the dollar figure as digits are added. For example, typing 4-2-7-5 would produce $0.00, $0.04, $0.42, $4.27, $42.75.
    
    // when textfield begins first responder, change textField.text = $0.00
    func textFieldDidBeginEditing(textField: UITextField) {
        textField.text = "$0.00"
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // when user enter num -> $0.00 will become $0.006666
    // Ideal -> typing 4-2-7-5 would produce $0.00, $0.04, $0.42, $4.27, $42.75.
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        // it's gonna be $0.00 as what it's there at textfield - even user typed "8" -> it's showing $0.08 on screen depends on what you called down below after stringByReplacingCharactersInRange
        var newText = textField.text! as NSString // only NSString can call below method, String cannot - to set range
        // resetting newText range from 0 to the end which user just finish typing - what user truly tuped!

        print("before stringByReplacingCharaInrange \(newText)")
        newText = newText.stringByReplacingCharactersInRange(range, withString: string) // newText NSString type so to call below method
        print("after stringByReplacingCharInRange \(newText)")
        var newTextString = String(newText) // NSString => to String -> so can use String method... can't use newText for direct calculation
        
        // I did something very wrong before - doing calculation directly to newText -> which is everything user typed! I should set another var to store the num for calculation
        // Below is the solution to my not working code before
        
        // screen off "$" & "." - only allows UTF32Char
        var digitText = ""
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        for c in newTextString.unicodeScalars {
            if digits.longCharacterIsMember(c.value) { // longCharacterIsMember -> if receiver is UTF32 Char -> if yes, grab value
                digitText.append(c)
            }
        }
        
        print("newTextString is... \(newTextString)")// newTextString is... $ 12.288
        print("digit Text is. ..... \(digitText)") // digit Text is. ..... 12288
     
        // trick - always cursor + option - to check obj' type
        let dollars = Int(digitText)! / 100
        let dollarString = String(dollars)
        
        let cents = Int(digitText)! % 100   // 8
        var centString = String(cents)      // "8"
        // cents = 8 and will display as "8", we want "08"
        if cents < 10 {
            centString = "0" + centString
        }
        
        let finalAnswer = ("$ \(dollarString).\(centString)")
        textField.text = finalAnswer // has to be String
        
        //print(finalAnswer)
    
        return false
        // return true // never return true for this situation, always need to proceed!
    }
    
}







