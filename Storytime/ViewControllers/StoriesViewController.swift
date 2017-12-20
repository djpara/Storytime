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
    
    fileprivate var data: [IStoryPreview] = []
    
    @IBOutlet fileprivate var storyCollectionView: UICollectionView!
//        = {
//        let layout = UICollectionViewFlowLayout()//ListCollectionViewLayout.self
//        layout.minimumLineSpacing = 0
//        layout.minimumInteritemSpacing = 0
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
//        view.backgroundColor = ATHENS_GRAY
//        view.alwaysBounceVertical = true
//        return view
//    }()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
//        loadData()
        loadTest()
//        reloadTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Set the collection view to match the view bounds
        storyCollectionView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureController()
    }
    
    private func configureView() {
        view.addSubview(storyCollectionView)
    }
    
    private func configureController() {
        // IGList Adapter
        adapter.collectionView = storyCollectionView
        adapter.dataSource = self
    }
    
    private func loadData() {
        
    }
    
//    internal func reloadTable() {
//        storyCollectionView.reloadData()
//    }
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
