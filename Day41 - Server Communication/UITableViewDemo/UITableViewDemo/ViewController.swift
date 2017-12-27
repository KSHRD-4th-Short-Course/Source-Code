//
//  ViewController.swift
//  UITableViewDemo
//
//  Created by KSHRD on 12/27/17.
//  Copyright © 2017 KSHRD. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let sectionData = ["Section 1", "Section 2", "Section 3", "Section 4", "Section 5"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionData[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell")
        
        cell?.textLabel?.text = sectionData[indexPath.row] + "----Row"
        return cell!
    }
    
    
}

