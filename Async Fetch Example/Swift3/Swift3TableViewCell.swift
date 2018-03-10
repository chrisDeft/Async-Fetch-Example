//
//  SwiftTableViewCell.swift
//  Async Fetch Example
//
//  Created by Chris Adamson on 04/09/2017.
//  Copyright © 2017 Chris Adamson. All rights reserved.
//

import UIKit

class Swift3TableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    var commitData: LocalCommitData?
    {
        didSet {
            guard let data = commitData else { return }
            
            dateLabel?.text = DateFormatter.localizedString(from: data.date, dateStyle: .medium, timeStyle: .short)
            userLabel?.text = data.name
            messageLabel?.text = data.message
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
