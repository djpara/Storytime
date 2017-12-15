//
//  ViewController.swift
//  StoryTyme
//
//  Created by David Para on 6/15/17.
//  Copyright © 2017 ParaD. All rights reserved.
//

import UIKit

class SelectedStoryViewController: BaseViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var postButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    /**
        Posts user input to the story board
        WILL EVENTUALLY MODIFY SO THAT IT POSTS TO A VOTING BOARD
    */
    private let punctuationList: [Character] = ["." , "?", "!", ","]
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /**
        Cleans text input from user and posts to the story board
        MAY NEED TO CLEAN THIS UP A LITTLE MORE LATER
    */
    @IBAction func postButtonPressed(_ sender: UIButton) {
        if textField.hasText {
            var lastCharacter = textField.text?.last
            if lastCharacter == " " {
                while lastCharacter == " " {
                    lastCharacter = textField.text?.removeLast()
                }
                textField.text?.append(lastCharacter!)
            }
            textView.text.append(textField.text!)
            if !punctuationList.contains(lastCharacter!) {
                textView.text.append(".")
            }
            
            textView.text?.append(" ")
            
            textField.text = ""
            dismissKeyboard()
        }
    }
    
    /**
        Main functions
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscribeKeyboardNotifications()
        
        // Adds tap recognizer to hide the keyboard when the user taps outside of the textField
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
        Resizes the UIView based on keyboard show/hide
    */
    func subscribeKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        bottomConstraint.constant = keyboardSize - 0.0
//        bottomConstraint.constant = keyboardSize - bottomLayoutGuide.length
        
        
        let duration: TimeInterval = (info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let info = notification.userInfo!
        bottomConstraint.constant = 0.0
        
        let duration: TimeInterval = (info[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        UIView.animate(withDuration: duration) { self.view.layoutIfNeeded() }
    }
    
    /**
        Hides the keyboard
    */
    @objc func dismissKeyboard() {
        textField.resignFirstResponder()
    }

}

