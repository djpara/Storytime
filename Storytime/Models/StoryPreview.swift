//
//  StoryPreview.swift
//  Storytime
//
//  Created by David Para on 12/6/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import Foundation
import UIKit

class StoryPreview {
    
    private var _title: String = ""
    private var _description: String = ""
    private var _category: [StoryCategory] = []
    private var _image: UIImage = STAR
    
    var title: String {
        get {
            return _title
        }
        set {
            if newValue.count > 2 {
                _title = newValue
            }
        }
    }
    
    var description: String {
        get {
            return _description
        }
        set {
            if newValue.count > 128 {
                let cutoff = newValue.index(newValue.startIndex, offsetBy: 128)
                _description = "\(String(newValue[..<cutoff]))..."
            } else {
                _description = newValue
            }
        }
    }
    
    var category: [StoryCategory] {
        get {
            return _category
        }
        set {
            _category = newValue
        }
    }
    
    var image: UIImage {
        get {
            return _image
        }
        set {
            _image = newValue
        }
    }
    
    init(title: String, description: String, category: [StoryCategory]) {
        self.title = title
        self.description = description
        self.category = category
    }
    
}
