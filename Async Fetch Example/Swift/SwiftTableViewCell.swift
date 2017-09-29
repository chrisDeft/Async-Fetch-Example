//
//  SwiftTableViewCell.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 04/09/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

class SwiftTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var commitData: LocalCommit?
    {
        didSet {
            guard let data = commitData else { return }
            
            dateLabel?.text = data.date.description
            userLabel?.text = data.login
            messageLabel?.text = data.message
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLabel.font = UIFont(name: "Avenir-Light", size:20) ?? .systemFont(ofSize: 20)
        dateLabel.textColor = .black
        userLabel.font = UIFont(name: "Avenir-Light", size:20) ?? .systemFont(ofSize: 20)
        userLabel.textColor = .black
        messageLabel.font = UIFont(name: "Avenir-Light", size:14) ?? .systemFont(ofSize: 14)
        messageLabel.textColor = .black
    }

}
