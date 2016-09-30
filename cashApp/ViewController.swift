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
        
        // Set UISwitch is off when viewDidLoad
        self.textSwitch.setOn(false, animated: false)
        
    }
    
    // user tap textfield, trigger to call its delegate below func
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // if switch is on, allow user to edit. vice versa
        return self.textSwitch.on
        // then where to show kb???? -> once user taps textfield, textfield becomes the firstresponder. kb will show automatically!
    }
    
    // after user tried to edit the textfield, nothing happen as switch is off
    // then user toggle switch, trigger below func -> if switch is turned off -> hide the keyboard
    // when dragging from MSB controller -> choose action - "valueChanged" as per Apple' developer
    // when switch is off, dismiss the keyboard by resigningFirstResponder!
    @IBAction func switchButtonToggled(sender: AnyObject) {
        if !(sender as! UISwitch).on {  // if it's off, then dismiss the keyboard
            textTextfield.resignFirstResponder()
        }
        print("switch button toggled!")
        if self.textSwitch.on {
            print("switch is on")
        } else {
            print("switch is off")
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textTextfield.resignFirstResponder()
        return true // enter button - hide the kb
    }
}


// Keyboard behaviour
// 1. switch is off when viewDidLoad
// self.editingSwitch.setOn(false, animated: false)

// 2. when toggle switch on/ off, trigger IBAction
// IBaction checks on button's status -> if off hide kb -> no code to show kb if it's turned on. because keyboard shows up when user touches the textfield, not toggle the switch
//if !(sender as! UISwitch).on {
//self.textField3.resignFirstResponder()
//}

// 3. user tap on textfield -> trigger "textFieldShouldBeginEditing" -> check switch's on/ off -> if yes -> return true (editing is allowed). If off, return false (no editing is allowed)
//return self.editingSwitch.on
// P.S. when user tap the textfield, and it let them to edit -> that textfield becomes first responsder -> kb shows up!
// this one replace the "shouldchangeCharacter" func

// 2. when user toggle, switch to be off-> trigger func 2's IBAction -> switch off = resignFirstResponder, then dismiss the kb!

// 4. when user hit enter, hide the keyboard - "textFieldShouldReturn"
//textField.resignFirstResponder()
//return true;

