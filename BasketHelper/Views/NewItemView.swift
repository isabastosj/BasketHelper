//
//  NewItemView.swift
//  BasketHelper
//
//  Created by Isabela Bastos Jastrombek on 29/11/23.
//

import SwiftUI
import SwiftData

struct NewItemView: View {
    @State var newName = ""
    @State var newQuantity = 1
    @State var newPrice = 0.0
    
    @Environment(\.modelContext) var modelContext
    @Binding var path: [Item]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Name Item") {
                    TextField("Item title", text: $newName)
                }
                .listRowBackground(Color("AppItemColor"))
                Section("Quantity") {
                    Stepper("Item number: \(newQuantity)",
                            value: $newQuantity,
                            in: 0...100,
                            step: 1)
                }
                .listRowBackground(Color("AppItemColor"))
                Section("Item Price") {
                    TextField("Price", value: $newPrice, format: .number)
                }
                .listRowBackground(Color("AppItemColor"))
            }
            .background(Color("AppBgColor"))
            .scrollContentBackground(.hidden)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        saveItem()
                        dismiss()
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(newName.isEmpty)
                }
            })
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(newName.isEmpty ? "New Item" : "Creating \(newName)")
            
        }
        .navigationViewStyle(.stack)
    }
    
    private func saveItem() {
        let newItem = Item(name: newName, timestamp: .now, quantity: newQuantity, price: newPrice)
        
        withAnimation {
            modelContext.insert(newItem)
        }
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
