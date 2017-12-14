//
//  StoryPreview.swift
//  Storytime
//
//  Created by David Para on 12/6/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import Foundation

class StoryPreview {
    
    private var _title: String = ""
    private var _description: String = ""
    private var _category: [StoryCategory] = []
    
    var title: String {
        get {
            return _title
        }
        set {
            if newValue.count > 2 {
                _title = title
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
                _description = description
            }
        }
    }
    
    var category: [StoryCategory] {
        get {
            return _category
        }
        set {
            _category = category
        }
    }
    
    init(title: String, description: String, category: [StoryCategory]) {
        self.title = title
        self.description = description
        self.category = category
    }
    
}
