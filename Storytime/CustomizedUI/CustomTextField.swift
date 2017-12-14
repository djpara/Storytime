//
//  CustomTextField.swift
//  StoryTyme
//
//  Created by David Para on 11/2/17.
//  Copyright © 2017 ParaD. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    // Storyboard initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBInspectable
    public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = self.borderWidth
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = self.borderColor.cgColor
        }
    }
    
    @IBInspectable
    public var postPlaceholderTextColor: UIColor = UIColor.clear {
        didSet {
            attributedPlaceholder = NSAttributedString(string: "Add to this story", attributes: [NSAttributedStringKey.foregroundColor : self.postPlaceholderTextColor])
        }
    }
    
}
