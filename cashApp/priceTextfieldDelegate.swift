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
    
    // when user enter num -> $0.00 will become $0.006666
    // Ideal -> typing 4-2-7-5 would produce $0.00, $0.04, $0.42, $4.27, $42.75.
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        
        var newText = textField.text! as NSString // only NSString can call below method, String cannot - to set range
        
        // resetting newText range from 0 to the end which user just finish typing
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        
        
        print(newText)
        
        return true
    }
    // set with the range... maybe before decimal and after decimal becomes 2 seprate events??
    
    // set it to true
    // var usesSignificantDigits: Bool { get set }
    //NSNumberFormatter - var maximumSignificantDigits: Int { get set }
    
    
    // as user type num, do something...
    
    // this one is hard so, make sure watch the swift tutorial!
}
