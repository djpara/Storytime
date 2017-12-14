//
//  CustomCellBackgroundView.swift
//  StoryTyme
//
//  Created by David Para on 11/23/17.
//  Copyright © 2017 ParaD. All rights reserved.
//

import UIKit

@IBDesignable
class CustomCellBackgroundView: UIView {

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
    public var borderColor: UIColor = UIColor.black {
        didSet {
            layer.borderColor = self.borderColor.cgColor
        }
    }
    
}
