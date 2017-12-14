//
//  CustomSearchBar.swift
//  StoryTyme
//
//  Created by David Para on 11/2/17.
//  Copyright © 2017 ParaD. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSearchBar: UISearchBar {

    // Storyboard initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    public var placeholderFont: UIFont = UIFont.systemFont(ofSize: 14) {
        didSet {
            let textField = value(forKey: "searchField") as? UITextField
            
            textField?.attributedPlaceholder = NSAttributedString(string: "Search stories", attributes: [NSAttributedStringKey.font : self.placeholderFont])
        }
    }
    
    @IBInspectable
    public var placeholderColor: UIColor = UIColor.clear {
        didSet {
            let textField = value(forKey: "searchField") as? UITextField
            
            textField?.attributedPlaceholder = NSAttributedString(string: "Search stories", attributes: [NSAttributedStringKey.foregroundColor : self.placeholderColor, NSAttributedStringKey.font : DEFAULT_FONT])
        }
    }
    
}
