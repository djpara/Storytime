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
//        loadData()
        loadTest()
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
        
    }
    
    internal func reloadTable() {
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

// MARK: TESTING FUNCTIONS
extension StoriesViewController {
    
    private func loadTest() {
        let storiesModelInstance = StoriesModel(delegate: self)
        
        data = storiesModelInstance.createTestStories(count: 10)
        data.append(storiesModelInstance.createCookoosNestTest())
    }
    
}
