//
//  StoryPreview.swift
//  Storytime
//
//  Created by David Para on 12/6/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

class StoryPreview: IStoryPreview, ListDiffable {
    
    private var _title: String = ""
    private var _description: String = ""
    private var _categories: [StoryCategory] = []
    private var _image: UIImage = STAR
    
    var storyTitle: String {
        get {
            return _title
        }
        set {
            if newValue.count > 2 {
                _title = newValue
            }
        }
    }
    
    var storyDescription: String {
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
    
    var storyCategories: [StoryCategory] {
        get {
            return _categories
        }
        set {
            _categories = newValue
        }
    }
    
    var storyImage: UIImage {
        get {
            return _image
        }
        set {
            _image = newValue
        }
    }
    
    init(title: String, description: String, category: [StoryCategory]) {
        self.storyTitle = title
        self.storyDescription = description
        self.storyCategories = category
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return _title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        
        guard self !== object else { return true }
        guard let object = object as? IStoryPreview else { return false }
        
        return storyTitle == object.storyTitle
    }
    
}
