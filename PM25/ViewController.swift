//
//  ViewController.swift
//  PM25
//
//  Created by 1134 on 2018/2/2.
//  Copyright © 2018年 Tim. All rights reserved.
//

import UIKit
import Crashlytics

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = [String]()
    var count = 0
    
    let defaultCellID = "defaultCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: defaultCellID)
        
        dataArray.append("one")
        dataArray.append("two")
        dataArray.append("three")
        dataArray.append("four")
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellID, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("number of cell\(indexPath.row) pressed!!")
        self.testCrash()
    }
    
    func testCrash() {
        let counts = 5/count
        print(counts)
    }
    
    //MARK: UITableViewDelegate

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

