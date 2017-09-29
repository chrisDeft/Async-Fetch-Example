//
//  SwiftViewController.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 30/08/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwiftModelUpdatedDelegate {
    
    fileprivate let viewModel = SwiftViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Swift"
        
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        refreshControl.addTarget(self, action: #selector(handleFetch), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
    }
    
    func viewModelUpdated() {
        
        DispatchQueue.main.async { [unowned self] in
                            self.refreshControl.endRefreshing()
                            self.tableView.reloadData()
                        }
    }
    
    func handleFetch() {
        
        viewModel.fetchRequest()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.results!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier:"swiftCell", for: indexPath) as? SwiftTableViewCell
        {
            cell.commitData = viewModel.results![indexPath.row] as LocalCommit!
            
            return cell
        }
        
        return UITableViewCell()
    }

}
