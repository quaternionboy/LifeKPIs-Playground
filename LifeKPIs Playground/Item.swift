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
    var data: String
    
    init() {
        self.data = "Origin"
    }
}

extension Item {
    func update() async {
        //heavy work...
        data = "Edited"
    }
}
