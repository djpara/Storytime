//
//  StoryPreviewCollectionViewCell.swift
//  Storytime
//
//  Created by David Para on 12/17/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import UIKit

class StoryPreviewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var storyTitle: UILabel!
    @IBOutlet private weak var storyDescription: UILabel!
    @IBOutlet private weak var storyImage: UIImageView!
    
    var storyPreview: IStoryPreview? {
        didSet {
            storyTitle.text = storyPreview?.storyTitle ?? ""
            storyDescription.text = storyPreview?.storyDescription ?? ""
            storyImage.image = storyPreview?.storyImage ?? STAR
        }
    }
}
