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
    @IBOutlet weak var picView: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var githubRepo: GithubRepo! {
        didSet{
            nameLabel.text = githubRepo.name
            picView.setImageWithURL(githubRepo.ownerAvatarURL!)
            userLabel.text = githubRepo.ownerHandle
            starsLabel.text = String(githubRepo.stars!)
            forksLabel.text = String(githubRepo.forks!)
            descriptionLabel.text = githubRepo.repoDescription
            
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
