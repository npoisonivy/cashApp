//
//  zipcodeTextfieldDelegate.swift
//  cashApp
//
//  Created by Nikki L on 9/26/16.
//  Copyright © 2016 Nikki. All rights reserved.
//

import Foundation
import UIKit

class zipcodeTextfieldDelegate : NSObject, UITextFieldDelegate {
    // make sure user can only type num -> done! MSB only shows num keypad
    // Zip code field. A text field that allows only digits, and a maximum of five characters.
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("user is adding or delecting 1 char!")
        
        var newText = textField.text! as NSString // NSString can call below method, String cannot!
        // resetting newText range from 0 to the end which user just finish typing
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        print(range)
        print(newText)

        print(newText.length)
        // how to limit to 5 digits limit? - need to listen to method "shouldChangeCharactersInRange" -> and check on newText's chars
        if newText.length < 6 {
            return true // give permission to textfield for displaying what user has typed.
        } else {
            return false // do not display anymore of what user is going to type!
            // I think the "range" at "stringByReplacingCharactersInRange" is set from here??? It'll stay (5,0), where I started returning false
        }
    }
    
}