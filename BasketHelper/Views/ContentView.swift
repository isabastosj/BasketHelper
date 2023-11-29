//
//  ContentView.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 09/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query var items: [Item]
    @State var path = [Item]()
    @State private var sortOrder = SortDescriptor(\Item.timestamp)
    @State private var searchText = ""
    
    @AppStorage("showOnboarding") private var showOnboarding = true
    @AppStorage("listname") private var userListName = ""
    
    @State var showNewItemSheet: Bool = false
    
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
                ZStack {
                    VStack {
                        Image("HeaderBackground")
                            .resizable()
                            .frame(height: 196)
                            .shadow(radius: 10)
                            .overlay {
                                HStack {
                                    Text("Basket**Helper**")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 32))
                                    
                                    Spacer()
                                    
                                }
                                .padding(.horizontal)
                                .offset(y: -14)
                            }
                        TextField("List name", text: $userListName)
                            .padding(.horizontal)
                        
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill( Color("AppItemColor").opacity(0.3))
                                
                                    .frame(height: 40)
                                    .padding(2)
                            }
                            .offset(y: -60)
                            .padding(.horizontal)
                        Spacer()
                        
                        
                    }
                    .ignoresSafeArea()
                    
                    Spacer()
                        .frame(height: 20)
                    
                    ItemListingView(sort: sortOrder, searchString: searchText)
                        .ignoresSafeArea()
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationDestination(for: Item.self, destination: EditItemView.init)
                        .toolbar {
                            ToolbarItem() {
                                Button(action: addItem) {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundStyle(.white)
                                        .fontWeight(.semibold)
                                        .font(.title3)
                                }
                                .padding(.top, 18)
                            }
                        }
                        .toolbarColorScheme(.dark, for: .navigationBar)
                        .toolbarBackground(.hidden, for: .navigationBar)
                    //                        .ignoresSafeArea()
                    
                }
                .background(Color("AppBgColor"))
            }
            
            VStack {
                Spacer()
                TotalView(totalPrice: totalPrice)
            }
            .padding(.bottom, 16)
        }
        .sheet(isPresented: $showNewItemSheet) {
            NewItemView(path: $path)
                .presentationDetents([.medium])
        }
        .fullScreenCover(isPresented: $showOnboarding) {
            ZStack {
                OnboardingView(showOnboarding: $showOnboarding)
            }
            
        }
    }
    
    private func addItem() {
//        withAnimation {
            showNewItemSheet.toggle()
//        }
    }
}

#Preview {
    ContentView()
    //        .modelContainer(for: Item.self, inMemory: true)
}
