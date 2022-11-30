//
//  EDFSignalHeader.swift
//
//  Created by Vicky Kumar on 22/11/22.
//

import Foundation

class EDFSignalHeader {
    
    
    var label: String
    var transducerType: String
    var physicalDimension: String
    var physicalMinimum: Double
    var physicalMaximum: Double
    var digitalMinimum: Double
    var digitalMaximum: Double
    var prefiltering: String
    var numberOfSamples: String
    var reserved: String
    var data = [Double]()
    
    
    init(data: Data, index: Int) {
        self.label = (String(data: data.subdata(in: 256 + 16 * index..<256 + 16 * index + 16), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? ""
        self.transducerType = (String(data: data.subdata(in: 256 + 16 * index + 16..<256 + 16 * index + 80), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? ""
        self.physicalDimension = (String(data: data.subdata(in: 256 + 8 * index + 1824..<256 + 8 * index + 1832), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? ""
        self.physicalMinimum = Double((String(data: data.subdata(in: 256 + 8 * index + 1976..<256 + 8 * index + 1984), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? "") ?? 0
        self.physicalMaximum = Double((String(data: data.subdata(in: 256 + 8 * index + 2128..<256 + 8 * index + 2136), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? "") ?? 0
        self.digitalMinimum = Double((String(data: data.subdata(in: 256 + 8 * index + 2280..<256 + 8 * index + 2288), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? "") ?? 0
        self.digitalMaximum = Double((String(data: data.subdata(in: 256 + 8 * index + 2432..<256 + 8 * index + 2440), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? "") ?? 0
        self.prefiltering = (String(data: data.subdata(in: 256 + 8 * index + 2600..<256 + 8 * index + 2650), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? ""
        self.numberOfSamples = String(data: data.subdata(in: 256 + 8 * index + 4104..<256 + 8 * index + 4112), encoding: .ascii) ?? ""
        self.reserved = String(data: data.subdata(in: 256 + 16 * index + 152..<256 + 16 * index + 256), encoding: .ascii) ?? ""
    }
    
}
