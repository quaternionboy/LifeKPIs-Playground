//
//  BackgroundPersistence.swift
//  LifeKPIs Playground
//
//  Created by Ferran Canals on 7/12/23.
//

import Foundation
import SwiftData

@ModelActor
actor DataManager{
    var a = 0
    
    func computeData(for itemID: PersistentIdentifier) async throws {
        let item = modelContext.model(for: itemID) as! Item
        item.data = expensiveWork()
        try modelContext.save()
    }
    
    
    
//    func store(data: Item) throws {
//        modelContext.insert(data)
//        try modelContext.save()
//    }
//
//    func loadAllData() throws -> [Item] {
//        let predicate = #Predicate<Item> { data in 1==1 }
//        let sort = SortDescriptor<Item>(\.data)
//        let descriptor = FetchDescriptor(predicate: predicate, sortBy: [sort])
//        
//        let result = try modelContext.fetch(descriptor)
//
//        return result
//    }
}

extension DataManager {
    private func expensiveWork() -> Double {
        for i in 0..<100_000 {
            print("\(i)")
        }
        return .random(in: 0...100)
    }
}
