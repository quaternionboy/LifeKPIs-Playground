//
//  ContentView.swift
//  LifeKPIs Playground
//
//  Created by Ferran Canals on 5/12/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var items: [Item]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    VStack(alignment: .leading){
                        Text("Name: \(item.name)")
                        if let data = item.data{
                            Text("Data: \(data)")
                        }
                        NavigationLink("Compute Data"){
                            ItemEditView(item: item)
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
            let newItem = Item(name: "Name\(items.count)")
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
