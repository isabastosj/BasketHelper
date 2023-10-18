//
//  EditItemView.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 09/10/23.
//

import SwiftUI
import SwiftData

struct EditItemView: View {
    @Bindable var item: Item
    @State private var value = 1
    @State private var value2 = 0
    var body: some View {
        Form {
            Section("Name Item") {
                TextField("Item title", text: $item.name)
            }
            .listRowBackground(Color("AppItemColor"))
            Section("Quantity") {
                Stepper("Item number: \(item.quantity)",
                        value: $item.quantity,
                        in: 0...100,
                        step: 1)
            }
            .listRowBackground(Color("AppItemColor"))
            Section("Item Price") {
                TextField("Price", value: $item.price, format: .number)
            }
            .listRowBackground(Color("AppItemColor"))
        }
        .background(Color("AppBackgroundColor"))
        .scrollContentBackground(.hidden)
        .navigationTitle(item.name.isEmpty ? "New Item" : "Editing \(item.name)")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Item.self, configurations: config)
        let sample = Item(name: "Exemple Item", timestamp: .now, isDone: false, quantity: 1, price: 0.0)
        
        return EditItemView(item: sample)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
