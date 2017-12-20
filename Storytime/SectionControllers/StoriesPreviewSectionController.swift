//
//  StoriesPreviewSectionController.swift
//  Storytime
//
//  Created by David Para on 12/6/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import UIKit
import IGListKit

class StoriesPreviewSectionController: ListSectionController {

    var storyPreview: IStoryPreview!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    /**
     Sets the size of each cell
     */
    override func sizeForItem(at index: Int) -> CGSize {
        
        guard let context = collectionContext, let _ = storyPreview else {
            return .zero
        }
        
        let width = context.containerSize.width/3
        
        return CGSize(width: width, height: 150)
    }
    
    /**
     Creates the cells for the collection view
     */
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        guard let storyCell = collectionContext?.dequeueReusableCell(withNibName: "StoryPreviewCell", bundle: nil, for: self, at: index) else { fatalError() }
        
        if let cell = storyCell as? StoryPreviewCollectionViewCell {
            cell.storyPreview = storyPreview
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    override func didSelectItem(at index: Int) {
        // TODO
    }
    
    override func didUpdate(to object: Any) {
        storyPreview = object as? IStoryPreview
    }
}
