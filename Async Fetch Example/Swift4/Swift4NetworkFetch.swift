//
//  Swift4NetworkFetch.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 10/03/2018.
//  Copyright © 2018 Chris Adamson. All rights reserved.
//

import Foundation

struct CodeableLocalCommit: Codable
{
    let commit: Commit

    struct Commit: Codable
    {
        let author: Author
        
        struct Author: Codable
        {
            let name: String?
            let date: Date?
        }
        
        let message: String?
    }

}

class Swift4FetchNetworkData {
    
    var delegate: DataUpdatedDelegate?
    var results: [CodeableLocalCommit] = [] {
        didSet {
            
            self.delegate?.dataUpdated()
        }
    }
    
    func fetchRequest() {
        
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            
            let swiftURLString = "https://api.github.com/repos/apple/swift/commits?per_page=100"
            guard let swiftURL = URL(string: swiftURLString) else { return }
            
            if let jsonData = try? Data(contentsOf: swiftURL) {
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    self.results = try decoder.decode([CodeableLocalCommit].self,
                                                        from: jsonData)
                    
                } catch let jsonError {
                    print ("Error:",jsonError)
                }
            }
        }
    }
}
