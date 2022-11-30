//
//  EDFData.swift
//
//  Created by Vicky Kumar on 15/11/22.
//

import Foundation

class EDFData {
    
    var signal: Int
    var header: EDFHeader
    var data: [Double]
    
    init?(url: URL, header: EDFHeader, signal: Int) {
        self.header = header
        self.signal = signal
        self.data = [Double]()
                let signalHeader = header.signalHeaders[signal]
                let signalSize = signalHeader.numberOfSamples
                let signalOffset = signalHeader.offset
                let signalSizeInBytes = signalSize * MemoryLayout<Double>.size
                let signalOffsetInBytes = signalOffset * MemoryLayout<Double>.size
                let signalData = Data(bytes: header.data.bytes.advanced(by: signalOffsetInBytes), count: signalSizeInBytes)
                let signalDataArray = (signalData)
                self.data = signalDataArray as! [Double]
    }
}
