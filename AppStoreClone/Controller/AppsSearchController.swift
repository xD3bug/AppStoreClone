//
//  AppsSearchController.swift
//  AppStoreClone
//
//  Created by Аслан on 02/10/2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import UIKit

class AppsSearchController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .red
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
