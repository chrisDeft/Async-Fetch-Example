//
//  Swift3NetworkFetch.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 10/03/2018.
//  Copyright © 2018 Chris Adamson. All rights reserved.
//

import Foundation

protocol DataUpdatedDelegate {
    
    func dataUpdated ()
}

struct LocalCommitData {
    
    let name: String
    let message: String
    let date: Date
}

class FetchNetworkData {
    
    var delegate: DataUpdatedDelegate?
    var results: [LocalCommitData] = [] {
        didSet {
            
            self.delegate?.dataUpdated()
        }
    }
    
    func fetchRequest() {
        
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            
            guard let swiftURL = URL(string: ApiUrl.GitHubSwiftRepository) else { return }
            
            if let jsonData = try? Data(contentsOf: swiftURL) {
                
                let resultsArray = JSON(jsonData).arrayValue
                var tempResults: [LocalCommitData] = []
                
                for commit in resultsArray
                {
                    let formatter = ISO8601DateFormatter()
                    let commitDate = formatter.date(from: commit["commit"]["author"]["date"].stringValue) ?? Date()
                    
                    let localCommit = LocalCommitData(name: commit["commit"]["author"]["name"].stringValue,
                                                  message: commit["commit"]["message"].stringValue,
                                                  date: commitDate)
                    tempResults.append(localCommit)
                }
                
                self.results = tempResults
            }
        }
    }
}
