//
//  ContentView.swift
//  LifeKPIs Playground
//
//  Created by Ferran Canals on 5/12/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(DataManager.self) private var dataManager
    @Query private var items: [Item]

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    HStack{
                        Text(item.data)
                        Button("Edit"){
                            Task{
                                await dataManager.updateItem(id: item.id)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item()
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
