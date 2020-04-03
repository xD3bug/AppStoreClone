//
//  AppDetailController.swift
//  AppStoreClone
//
//  Created by Аслан on 08.12.2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import UIKit

class AppDetailController: BaseCollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let detailCellId = "detailCellId"
    let previewId = "previewId"
    let reviewCellId = "reviewCellId"
    
    fileprivate let appId: String
    var app: Result?
    var reviews: Reviews?
    
    // DI constructor
    init(appId: String) {
        self.appId = appId
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewId)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewCellId)
        
        fetchDataFromItunes()
    }
    
    fileprivate func fetchDataFromItunes() {
        let urlString = "http://itunes.apple.com/lookup?id=\(appId)"
        
        Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
            
            let app = result?.results.first
            self.app = app
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        let reviewsUrl = "https://itunes.apple.com/rss/customerreviews/id=\(appId)/sortBy=mostRecent/json"
        
        Service.shared.fetchGenericJSONData(urlString: reviewsUrl) { (reviews: Reviews?, err) in
            
            if let err = err {
                print("failed to decode reviews: ", err.localizedDescription)
                return
            }
            
            self.reviews = reviews
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
//            reviews?.feed.entry.forEach({ print($0.rating.label)})
//            reviews?.feed.entry.forEach({ (entry) in
//                print(entry.title.label, entry.author.name.label, entry.content.label)
//            })
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
            
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewId, for: indexPath) as! PreviewCell
            cell.horizontalController.app = self.app
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewRowCell
            cell.reviewsController.reviews = self.reviews
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 280
        
        if indexPath.item == 0 {
            // Calculate necessarry size for cell
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            
            // dummyCell.releaseNotesLabel.text = app?.releaseNotes
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            height = estimatedSize.height
            
        } else if indexPath.item == 1 {
            height = 500
        }
        else {
            height = 280
        }
        return .init(width: view.frame.width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 0, bottom: 16, right: 0)
    }
    
    // Required init for DI constructor
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
