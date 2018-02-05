//
//  Logger.swift
//  PM25
//
//  Created by 1134 on 2018/2/5.
//  Copyright © 2018年 Tim. All rights reserved.
//

import Foundation
//import Crashlytics

func log(_ format: Any, _ args: [CVarArg] = [], file: String = #file, function: String = #function, line: Int = #line) {
    //let filename = URL(string: file)?.lastPathComponent.components(separatedBy: ".").first
    let fileName = (file as NSString).lastPathComponent.replacingOccurrences(of: ".swift", with: "")
    #if DEBUG
        Swift.print("\(fileName).\(function) line \(line) ==> \n \(format)")
    #else
//Release
//        Swift.print("\(fileName).\(function) line \(line) ==> \n \(format)", getVaList(args))
    #endif
}
