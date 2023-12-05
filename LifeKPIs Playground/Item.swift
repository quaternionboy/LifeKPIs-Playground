//
//  Item.swift
//  LifeKPIs Playground
//
//  Created by Ferran Canals on 5/12/23.
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
