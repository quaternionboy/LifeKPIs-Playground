//
//  LifeKPIs_PlaygroundApp.swift
//  LifeKPIs Playground
//
//  Created by Ferran Canals on 5/12/23.
//

import SwiftUI
import SwiftData

@main
struct LifeKPIs_PlaygroundApp: App {
    
    let container: ModelContainer
    let dataManager: DataManager
    
    init(){
        container = {
            do {
                return try ModelContainer(for: Item.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()
        
        dataManager = DataManager(container:container)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
        .environment(dataManager)
    }
}
