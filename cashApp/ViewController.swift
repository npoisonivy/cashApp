//
//  ViewController.swift
//  cashApp
//
//  Created by Nikki L on 9/26/16.
//  Copyright © 2016 Nikki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // create outlets - these are outlet as user interacts with app, trigger each textfield to call its own delegate (with diff behaviour), will call "shouldChangeCharacters"... -> WHEN user add/ delete any ONE char. Then, in our code, manipulate the textfield's text = newText. Next, display newText @ textfield on app. That explain why they are outlet. Because code is telling UI what to do = to display the newText which is the text that user enters by "return true" at the end
    @IBOutlet weak var zipcodeTextfield: UITextField!
    @IBOutlet weak var priceTextfield: UITextField!
    @IBOutlet weak var textTextfield: UITextField! // this one's delegate can be self...
    @IBOutlet weak var textSwitch: UISwitch! // set switch outlet, so we can detect its state - isOn or not.
    
    // declare delegate for each TextField
    let zipcodeDelegate = zipcodeTextfieldDelegate() // need to create the file!
    let priceDelegate = priceTextfieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // declare which textfield is using which delegate!
        self.zipcodeTextfield.delegate = zipcodeDelegate
        self.priceTextfield.delegate = priceDelegate
        self.textTextfield.delegate = self
        
        // UISwitch is on when viewDidLoad
        textSwitch.setOn(true, animated: true)
        
        
        
    }
    // whenever user add/ delete ONE char, textfield will call delegate "shouldChangeCharactersInRange" method
//    Lockable text field. This is composed of a text field and a switch. When the switch is on, the text field can be edited. When the switch is off, the text field cannot be edited.
     func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString // resetting textfield's text
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        // and it's up to us if we want to show user's typed text or NOT
        if self.textSwitch.on {
            print("show what user type!")
            return true
        } else {
            return false // do not show what user has typed!
        }
    }
    
    
    // choose action - "valueChanged" as per Apple' developer
    @IBAction func switchButtonToggled(sender: AnyObject) {
        print("switch button toggled!")
        if self.textSwitch.on {
            print("switch is on")
        } else {
            print("switch is off")
        }
    }
}

