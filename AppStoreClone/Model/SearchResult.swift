//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by Аслан on 06/10/2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
}
