//
//  SwiftModel.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 31/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import Foundation

// Swift 4

//struct LocalCommit: Codable
//{
//    let author: Author
//    
//    struct Author: Codable
//    {
//        let login: String
//    }
//    
//    let commit: Commit
//    
//    struct Commit: Codable
//    {
//        let message: String
//    }
//
//}

// Swift 3

struct LocalCommit
{
    let login: String
    let message: String
    let date: Date
}


