//
//  EDFHeader.swift
//
//  Created by Vicky Kumar on 16/11/22.
//

import Foundation

class EDFHeader {
    
    var version: String
    var patientID: String
    var recordingID: String
    var startDate: Date
    var startTime: Date
    var headerSize: Int
    var reserved: String
    var numberOfRecords: Int
    var durationOfRecords: Double
    var numberOfSignals: Int
    var signalHeaders: [EDFSignalHeader]
    var data: Data
    
    init?(url: URL) {
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        self.data = data as Data
        self.version = String(data: data.subdata(in: 0..<8), encoding: .ascii) ?? ""
        self.patientID = String(data: data.subdata(in: 8..<88), encoding: .ascii) ?? ""
        self.recordingID = String(data: data.subdata(in: 88..<168), encoding: .ascii) ?? ""
        self.startDate = EDFHeader.date(from: String(data: data.subdata(in: 168..<176), encoding: .ascii) ?? "")
        self.startTime = EDFHeader.time(from: String(data: data.subdata(in: 176..<184), encoding: .ascii) ?? "")
        self.headerSize = Int((String(data: data.subdata(in: 184..<192), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? "") ?? 0
        self.reserved = String(data: data.subdata(in: 192..<236), encoding: .ascii) ?? ""
        self.numberOfRecords = Int((String(data: data.subdata(in: 236..<244), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? "") ?? 0
        self.durationOfRecords = Double((String(data: data.subdata(in: 244..<252), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? "") ?? 0
        self.numberOfSignals = Int((String(data: data.subdata(in: 252..<256), encoding: .ascii)?.filter { !" \n\t\r".contains($0) }) ?? "") ?? 0
        self.signalHeaders = [EDFSignalHeader]()
        
        
        for i in 0..<self.numberOfSignals {
            let signalHeader = EDFSignalHeader(data: data, index: i)
            print(signalHeader.numberOfSamples,"signalHeader:-",signalHeader.label)
            self.signalHeaders.append(signalHeader)
        }
    }
    
    static func date(from string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        return dateFormatter.date(from: string) ?? Date()
    }
    
    static func time(from string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH.mm.ss"
        return dateFormatter.date(from: string) ?? Date()
    }
    
}
