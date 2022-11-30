//
//  EDFReader.swift
//
//  Created by Vicky Kumar on 17/11/22.
//

import Foundation

class EDFReader {
    
    var edf: EDF?
    
    init?(url: URL) {
        guard let edf = EDF(url: url) else {
            return nil
        }
        self.edf = edf
    }
    
    func signal(label: String) -> EDFSignal? {
        return self.edf?.signals.filter({ $0.label == label }).first
    }
    
    func signal(index: Int) -> EDFSignal? {
        return self.edf?.signals[index]
    }
    
}
