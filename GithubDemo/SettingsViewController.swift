//
//  SettingsViewController.swift
//  GithubDemo
//
//  Created by Nikhil Thota on 2/10/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

@objc protocol SettingsViewControllerDelegate: class {
    optional func settingsViewController(settingsViewController: SettingsViewController, didUpdateFilters filters: [String:AnyObject])
    
    //optional func didSaveSettings(settings: GithubRepoSearchSettings)
    optional func didCancelSettings()
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SwitchCellDelegate {
    
    var languages: [[String:String]]!
    var switchStates = [Int:Bool]()
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: SettingsViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        languages = githubLanguages()
        
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return languages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("SwitchCell", forIndexPath: indexPath) as! SwitchCell
        
        cell.switchLabel.text = languages[indexPath.row]["name"]
        
        cell.delegate = self
        
        cell.switchItem.on = switchStates[indexPath.row] ?? false
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onCancel(sender: AnyObject) {
        //self.delegate?.didCancelSettings()
    }
    
    @IBAction func onSave(sender: AnyObject) {
        let filters = [String : AnyObject]()
        delegate?.settingsViewController?(self, didUpdateFilters: filters)
    }
    
    func switchCell(switchCell: SwitchCell, didChangedValue value: Bool) {
        let indexPath = tableView.indexPathForCell(switchCell)!
        
        switchStates[indexPath.row] = value
    }
    
    func githubLanguages() -> [[String:String]]{
        return [["name" : "Java", "code" : "java"],
            ["name" : "JavaScript", "code" : "java"],
            ["name" : "Objective-C", "code" : "java"],
            ["name" : "Python", "code" : "java"],
            ["name" : "Ruby", "code" : "java"],
            ["name" : "Swift", "code" : "java"]]
    }
    
}
