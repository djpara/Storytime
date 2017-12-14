//
//  StoriesViewController.swift
//  Storytime
//
//  Created by David Para on 12/3/17.
//  Copyright © 2017 David Para. All rights reserved.
//

import UIKit
import IGListKit

class StoriesViewController: BaseViewController {
    
    fileprivate final let STORIES_LABEL = "Stories"
    
    fileprivate var data: [Any] = []
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        configureController()
        loadData()
        reloadTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func configureView() {
        
    }
    
    private func configureController() {
        adapter.collectionView = storyCollectionView
        adapter.dataSource = self
    }
    
    private func loadData() {
        data = createTestStories(count: 10)
        data.append(createCookoosNestTest())
    }
    
    private func reloadTable() {
        storyCollectionView.reloadData()
    }
}

// MARK: ListAdapterDataSource extentions and functions
extension StoriesViewController: ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return data as! [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return StoriesPreviewSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

// MARK: Tester functions
extension StoriesViewController {
    
    fileprivate func createTestStories(count: Int) -> [StoryPreview] {
        var title: String = ""
        var description: String = ""
        var category: [StoryCategory] = []
        
        var testStories: [StoryPreview] = []
        
        for c in 1...count {
            title = "Test Story \(c)"
            description = "This is a description which is compososed of the first 32 characters of the story's summary."
            category = [.Action, .Comedy, .Drama, .Fiction, .Horror, .Mature, .Mystery, .NonFiction]
            testStories.append(StoryPreview(title: title, description: description, category: category))
        }
        
        return testStories
    }
    
    fileprivate func createCookoosNestTest() -> StoryPreview {
        let title = "One flew over the coocoo nest"
        let description = "One Flew Over the Cuckoo's Nest (1962) is a novel written by Ken Kesey. Set in an Oregon psychiatric hospital, the narrative serves as a study of the institutional processes and the human mind as well as a critique of behaviorism and a celebration of humanistic principles. It was adapted into the Broadway play One Flew Over the Cuckoo's Nest by Dale Wasserman in 1963. Bo Goldman adapted the novel into a 1975 film directed by Miloš Forman, which won five Academy Awards."
        let category: [StoryCategory] = [.Drama, .NonFiction]
        
        return StoryPreview(title: title, description: description, category: category)
    }
}
