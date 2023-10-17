//
//  ContentView.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 09/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var items: [Item]
    @State private var path = [Item]()
    @State private var sortOrder = SortDescriptor(\Item.timestamp)
    @State private var searchText = ""
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    
    var totalPrice: Double {
        var num = 0.0
        for item in items {
            if item.isDone {
                num += item.price * Double(item.quantity)
            }
        }
        return num
    }
    
    var body: some View {
        ZStack {
            NavigationStack(path: $path) {
                ItemListingView(sort: sortOrder, searchString: searchText)
                    .ignoresSafeArea()
                    .background(Color("AppBackgroundColor"))
                    .navigationTitle("Basket Helper")
                    .navigationBarTitleDisplayMode(.large)
                    .navigationDestination(for: Item.self, destination: EditItemView.init)
                    .searchable(text: $searchText, placement: .automatic)
                    .toolbar {
                        ToolbarItem() {
                            Button(action: addItem) {
                                Image(systemName: "plus")
                                    .fontWeight(.semibold)
                            }
                        }
                    }
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarBackground(
                        Color("AppColor"),
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .ignoresSafeArea()
            }
            
            
            VStack {
                Spacer()
                TotalView(totalPrice: totalPrice)
            }
            .padding(.bottom, 16)
        }
        .background(Color("AppBackgroundColor"))
        .fullScreenCover(isPresented: $showOnboarding) {
            ZStack {
                OnboardingView(showOnboarding: $showOnboarding)
            }
            
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item()
            modelContext.insert(newItem)
            path = [newItem]
        }
    }
}

#Preview {
    ContentView()
    //        .modelContainer(for: Item.self, inMemory: true)
}
