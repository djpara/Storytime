//
//  IStoryPreview.swift
//  Storytime
//
//  Created by David Para on 12/10/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import Foundation
import UIKit

protocol IStoryPreview {
    var storyTitle: String { get set }
    var storyDescription: String { get set }
    var storyCategories: [StoryCategory] { get set }
    var storyImage: UIImage { get set }
}
