//
//  Swift3ViewController.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 10/03/2018.
//  Copyright © 2018 Chris Adamson. All rights reserved.
//

import UIKit

class Swift3ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataUpdatedDelegate {
    
    fileprivate let networkFetch = FetchNetworkData()
    
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift 3"
        
        networkFetch.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(handleFetch), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        networkFetch.fetchRequest()
        
    }
    
    func dataUpdated() {
        
        DispatchQueue.main.async { [unowned self] in
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    func handleFetch() {
        
        networkFetch.fetchRequest()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return networkFetch.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier:"swiftCell", for: indexPath) as? SwiftTableViewCell
        {
            cell.commitData = networkFetch.results[indexPath.row] as LocalCommitData
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}
