//
//  ViewController.swift
//  PM25
//
//  Created by 1134 on 2018/2/2.
//  Copyright © 2018年 Tim. All rights reserved.
//

/**
 PM2.5數值            PM10
 value > 35 : 紫爆    value > 70
 value > 25 : 紅爆    value > 50
 value > 15 : 普通    value > 30
 value < 10 : 良好    value < 20
 */

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = [String]()
    var count = 0
    
    let defaultCellID = "defaultCellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: defaultCellID)
        
//        dataArray.append("one")
//        dataArray.append("two")
//        dataArray.append("three")
//        dataArray.append("four")
        
        callApi()
    }
    
    private func callApi() {
        
        HttpManager.callTaiwanPM25 { (success, data) in
            
            if success, let dataStruct = data {
                log(dataStruct)
            } else {
                log("NONONONONONONONONO")
            }
        }
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
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        log("number of cell\(indexPath.row) pressed!!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

