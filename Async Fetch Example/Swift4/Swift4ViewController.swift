//
//  Swift4ViewController.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 10/03/2018.
//  Copyright © 2018 Chris Adamson. All rights reserved.
//

import UIKit

class Swift4ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataUpdatedDelegate {
    
    fileprivate let networkFetch = Swift4FetchNetworkData()
    
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift 4"
        
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier:"swift4Cell", for: indexPath) as? Swift4TableViewCell
        {
            cell.commitData = networkFetch.results[indexPath.row] as CodeableLocalCommit
            
            return cell
        }
        
        return UITableViewCell()
    }
    
}
