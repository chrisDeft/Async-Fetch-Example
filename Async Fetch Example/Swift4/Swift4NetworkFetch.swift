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
            let name: String
            let date: Date
        }
        
        let message: String
    }

}

class Swift4FetchNetworkData {
    
    var dataUpdated: (()->())?
    
    var results: [CodeableLocalCommit] = [] {
        didSet {
            
            self.dataUpdated?()
        }
    }
    
    func fetchRequest() {
        
        DispatchQueue.global(qos: .userInitiated).async { [unowned self] in
            
            guard let swiftURL = URL(string: ApiUrl.GitHubSwiftRepository) else { return }
            
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
