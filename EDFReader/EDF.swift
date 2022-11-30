//
//  EDF.swift
//
//  Created by Vicky Kumar on 15/11/22.
//

import Foundation

class EDF {
    
    var header: EDFHeader
    var signals: [EDFSignal]
    
    init?(url: URL) {
        guard let header = EDFHeader(url: url) else {
            return nil
        }
        self.header = header
        self.signals = [EDFSignal]()
        for i in 0..<header.numberOfSignals {
            let signal = EDFSignal(label: header.signalHeaders[i].label, data1: header.signalHeaders[i].data)
            self.signals.append(signal)
        }
    }
    
}
