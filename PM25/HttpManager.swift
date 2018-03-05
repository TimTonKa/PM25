//
//  HttpManager.swift
//  PM25
//
//  Created by 1134 on 2018/2/5.
//  Copyright © 2018年 Tim. All rights reserved.
//

import UIKit

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

let pm25UrlStr = "https://pm25.lass-net.org/data/last-all-epa.json"

class HttpManager: NSObject {
    
    //PM2.5台灣環保署測站
    static public func callTaiwanPM25 (callback: @escaping (_ success: Bool, _ data: PM25Struct?)->()) {
        
        if let url = URL(string: pm25UrlStr) {
            
            let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                
                if error == nil, let data = data {
                    
                    let decoder = JSONDecoder()
                    if let decodeData = try? decoder.decode(PM25Struct.self, from: data) {
                        callback(true, decodeData)
                    } else {
                        log("Json decode failure")
                        callback(false, nil)
                    }
                } else {
                    log("Error: \(error.debugDescription)")
                    callback(false, nil)
                }
            })
            task.resume()
        }
        
    }
}
