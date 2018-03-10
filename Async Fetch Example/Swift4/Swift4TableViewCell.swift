//
//  Swift4TableViewCell.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 10/03/2018.
//  Copyright © 2018 Chris Adamson. All rights reserved.
//

import UIKit

class Swift4TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var commitData: CodeableLocalCommit?
        {
        didSet {
            guard let data = commitData else { return }
            
            dateLabel?.text = DateFormatter.localizedString(from: data.commit.author.date, dateStyle: .medium, timeStyle: .short)
            userLabel?.text = data.commit.author.name
            messageLabel?.text = data.commit.message
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dateLabel.font = UIFont(name: FontName.AvenirLight, size:20) ?? .systemFont(ofSize: 20)
        dateLabel.textColor = .black
        userLabel.font = UIFont(name: FontName.AvenirLight, size:20) ?? .systemFont(ofSize: 20)
        userLabel.textColor = .black
        messageLabel.font = UIFont(name: FontName.AvenirLight, size:14) ?? .systemFont(ofSize: 14)
        messageLabel.textColor = .black
    }

}
