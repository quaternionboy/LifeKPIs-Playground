//
//  ItemEditView.swift
//  LifeKPIs Playground
//
//  Created by Ferran Canals on 7/12/23.
//

import SwiftUI
import SwiftData

struct ItemEditView: View {
    @Environment(\.modelContext) private var modelContext
    let item: Item
    @State private var text = "Computing..."
    
    var body: some View {
        HStack{
            Text(text)
        }
        .task{
//            Task.detached{
                do {
                    let dataManager = DataManager(modelContainer: modelContext.container)
                    try await dataManager.computeData(for: item.id)
                    text = String(item.data!)
                    // Not sure if saving the main context is also needed
                    try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
//            }
        }
    }
}

//#Preview {
//    ItemEditView()
//}
