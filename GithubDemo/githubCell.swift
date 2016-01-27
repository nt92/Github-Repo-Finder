//
//  GithubCell.swift
//  GithubDemo
//
//  Created by Nikhil Thota on 1/26/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class GithubCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var githubRepo: GithubRepo! {
        didSet{
            nameLabel.text = githubRepo.name
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
