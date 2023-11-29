//
//  ItemListingView.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 09/10/23.
//

import SwiftUI
import SwiftData

struct ItemListingView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Item.name, order: .reverse), SortDescriptor(\Item.timestamp)]) var items: [Item]
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color(uiColor: .clear))
                .frame(height: 188)
            
            List {
                ForEach(items) { item in
                    ItemCardView(item: item)
                        .listRowBackground(
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(item.isDone ? Color("AppItemColor").opacity(0.5) : Color("AppItemColor"))
                                        .frame(height: 40)
                                        .padding(2)
                                )
                        .listRowSeparator(.hidden)
                }
                .onDelete(perform: deleteItems)
                .listStyle(.automatic)
            }
            .scrollContentBackground(.hidden)
            .buttonStyle(PlainButtonStyle())
            Rectangle()
                .fill(Color(uiColor: .clear))
                .frame(height: 104)
        }
        .ignoresSafeArea()
    }
    init(sort: SortDescriptor<Item>, searchString: String) {
        _items = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        },sort: [sort])
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
    ItemListingView(sort: SortDescriptor(\Item.timestamp), searchString: "")
}
