//
//  BaseCollectionViewController.swift
//  AppStoreClone
//
//  Created by Аслан on 11.10.2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import UIKit

class BaseCollectionViewController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



