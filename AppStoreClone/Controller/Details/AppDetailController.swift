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
    
    var appId: String! {
        didSet {
            print("My app id: ", appId)
            let urlString = "http://itunes.apple.com/lookup?id=\(appId ?? "")"
            
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, err) in
                
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    var app: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewId, for: indexPath) as! PreviewCell
            cell.horizontalController.app = self.app
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            // Calculate necessarry size for cell
             let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
             
            // dummyCell.releaseNotesLabel.text = app?.releaseNotes
             dummyCell.app = app
             dummyCell.layoutIfNeeded()
             
             let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
             
             return .init(width: view.frame.width, height: estimatedSize.height)
            } else {
            return .init(width: view.frame.width, height: 500)
        }
    }
}
