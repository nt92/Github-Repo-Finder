//
//  SwitchCell.swift
//  GithubDemo
//
//  Created by Nikhil Thota on 2/11/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate{
    optional func switchCell(switchCell: SwitchCell, didChangedValue value:Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchItem: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    weak var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //works same as control drag
        switchItem.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged(){
        if delegate != nil {
            delegate!.switchCell?(self, didChangedValue: switchItem.on)
        }
    }

}
