//
//  StoriesModel.swift
//  Storytime
//
//  Created by David Para on 12/14/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import Foundation

class StoriesModel {
    
    private var _delegate: StoriesViewController?
    
    // Use internal function to get and set the delegate parameter
    internal var delegate : StoriesViewController? {
        get {
            return _delegate
        }
        set {
            _delegate = newValue
        }
    }
    
    init(delegate d: StoriesViewController) {
        delegate = d
    }
    
    /**
     Return x number of story previews to be used for testing
     */
    internal func createTestStories(count: Int) -> [IStoryPreview] {
        var title: String = ""
        var description: String = ""
        var category: [StoryCategory] = []
        
        var storyPreviews: [IStoryPreview] = []
        
        for c in 1...count {
            title = "Test Story \(c)"
            description = "This is a description which is compososed of the first 32 characters of the story's summary."
            category = [.Action, .Comedy, .Drama, .Fiction, .Horror, .Mature, .Mystery, .NonFiction]
            storyPreviews.append(StoryPreview(title: title, description: description, category: category))
        }
        
        return storyPreviews
    }
    
    /**
     Returns One Flew over the Cuckoo's Nest story preview to be used for testing
     */
    internal func createCookoosNestTest() -> IStoryPreview {
        let title = "One Flew Over the Cuckoo's Nest"
        let description = "One Flew Over the Cuckoo's Nest (1962) is a novel written by Ken Kesey. Set in an Oregon psychiatric hospital, the narrative serves as a study of the institutional processes and the human mind as well as a critique of behaviorism and a celebration of humanistic principles. It was adapted into the Broadway play One Flew Over the Cuckoo's Nest by Dale Wasserman in 1963. Bo Goldman adapted the novel into a 1975 film directed by Miloš Forman, which won five Academy Awards."
        let category: [StoryCategory] = [.Drama, .NonFiction]
        
        let storyPreview = StoryPreview(title: title, description: description, category: category)
        storyPreview.storyImage = CUCKOOS_NEST
        
        return storyPreview
    }
}
