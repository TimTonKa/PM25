//
//  ViewController.swift
//  PM25
//
//  Created by 1134 on 2018/2/2.
//  Copyright © 2018年 Tim. All rights reserved.
//

import UIKit
import Crashlytics

struct PM25Struct: Codable {
    
    var source: String
    var version: String
    var num_of_records: Int
    
    struct AreaStruct: Codable {
        var PM2_5_AVG: CGFloat?
        var app: String
        var PublishTime: String
        var fmt_opt: String
        var WindSpeed: CGFloat?
        var O3: CGFloat?
        var NO2: CGFloat?
        var Status: String
        var SiteEngName: String
        var NO: CGFloat?
        var SiteName: String
        var SiteType: String
        var CO_8hr: CGFloat?
        var AQI: CGFloat?
        var Pollutant: String?
        var PM2_5: CGFloat?
        var gps_lat: CGFloat
        var CO: CGFloat?
        var timestamp: String
        var WindDirec: CGFloat?
        var PM10_AVG: CGFloat?
        var gps_lon: CGFloat
        var O3_8hr: CGFloat?
        var NOx: CGFloat?
        var date: String
        var device_id: String
        var ver_format: String
        var PM10: CGFloat
        var County: String
        var SO2: CGFloat
        var time: String
    }

    var feeds:[AreaStruct]
}

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
        
        if let url = URL(string: "https://pm25.lass-net.org/data/last-all-epa.json") {
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error == nil, let data = data {
                    
                    let decoder = JSONDecoder()
                    if let decodeData = try? decoder.decode(PM25Struct.self, from: data) {
                        log(decodeData)
                    } else {
                        log("Json decode failure")
                    }
                    
                } else {
                    log("Error: \(error.debugDescription)")
                }
            })
            task.resume()
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

