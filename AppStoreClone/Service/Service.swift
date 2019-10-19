//
//  Service.swift
//  AppStoreClone
//
//  Created by Аслан on 06/10/2019.
//  Copyright © 2019 Doka.fun. All rights reserved.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        print("Fetching apps from service layer")
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            if let err = err {
                print("Failed to fetch apps: ", err.localizedDescription)
                completion([], err)
                return
            }
            // Success
            // print(String(data: data!, encoding: .utf8))
            guard let data = data else { return }
            
            do {
                let searchResult =  try JSONDecoder().decode(SearchResult.self, from: data)
                //searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
                completion(searchResult.results, nil)
                
            } catch let jsonErr {
                print("Failed to decode JSON: ", jsonErr.localizedDescription)
                completion([], jsonErr)
            }
        }.resume()
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) ->() ) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                appGroup.feed.results.forEach({ print($0.name) })
                completion(appGroup, nil)
            } catch {
                completion(nil, error)
            }
            
        }.resume()
    }
}
