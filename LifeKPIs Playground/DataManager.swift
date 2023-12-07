//
//  DataManager.swift
//  LifeKPIs Playground
//
//  Created by Ferran Canals on 6/12/23.
//

import Foundation
import SwiftData

class DataManager: Observable {
    let container: ModelContainer
    init(container: ModelContainer) {
        self.container = container
    }
}

extension DataManager {
    func updateItem(id: PersistentIdentifier) async {
        
        for i in 0..<100_000 {
            print("\(i)")
        }
        
        let context = ModelContext(container)
        context.autosaveEnabled = false
        let item = context.model(for:id) as! Item
        item.data = "Edited"
        try! context.save()
    }
}

func myAsyncFunction() async {
    for i in 0..<100_000 {
        print("\(i)")
    }
}


func mySyncFunction() {
    for i in 0..<100_000 {
        print("\(i)")
    }
}
