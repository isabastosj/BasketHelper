//
//  BasketHelperNano4App.swift
//  BasketHelperNano4
//
//  Created by Isabela Bastos Jastrombek on 09/10/23.
//

import SwiftUI
import SwiftData

@main
struct BasketHelperNano4App: App {
    
    let modelContainer: ModelContainer
        
    init() {
        do {
            modelContainer = try ModelContainer(for: Item.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
        .modelContainer(for: Item.self)
    }
}
