//
//  AppGroup.swift
//  AppStoreClone
//
//  Created by Аслан on 14.10.2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id: String
    let artistName: String
    let name: String
    let artworkUrl100: String
}
