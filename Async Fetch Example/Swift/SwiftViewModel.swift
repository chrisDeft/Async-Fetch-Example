//
//  SwiftViewModel.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 31/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import Foundation

protocol SwiftModelUpdatedDelegate {
    
    func viewModelUpdated ()
}

class SwiftViewModel: NSObject
{
    var results: Array<LocalCommit>? = []
    var delegate: SwiftModelUpdatedDelegate?
    
    func fetchRequest() {
        
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            
            if let jsonData = try? Data(contentsOf: URL(string: "https://api.github.com/repos/apple/swift/commits?per_page=100")!) {
                
                let resultsData = JSON(jsonData)
                let resultsDataArray = resultsData.arrayValue
                
                for commit in resultsDataArray
                {
                    let formatter = ISO8601DateFormatter()
                    let commitDate = formatter.date(from: commit["commit"]["committer"]["date"].stringValue) ?? Date()
                    
                    let localCommit = LocalCommit(login: commit["author"]["login"].stringValue,
                                                  message: commit["commit"]["message"].stringValue,
                                                  date: commitDate)
                    self.results?.append(localCommit)
                }
                
                // Swift 4
                
                //let jsonDecoder = JSONDecoder()
                //self.results = try? jsonDecoder.decode(Array<LocalCommit>.self,
                //                                  from: jsonData)
                
                
                
                self.delegate?.viewModelUpdated()
                
            }
        }
        
        
    }
}
