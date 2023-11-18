//
//  Item.swift
//  HigherOrderFunctions
//
//  Created by خالد on 04/05/1445 AH.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
